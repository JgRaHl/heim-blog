---
title: What is activerecord-embedded?
date: 2012-07-28 21:18 +02:00
tags:
---

Recently I found some shortcomings in ActiveRecord.

For example, take the following simple models. We are defining an
invoice that may list **n** items.

    class Invoice < ActiveRecord::Base
      belongs_to :user
      has_many :items, :dependent => :destroy
    end

    class Item < ActiveRecord::Base
      belongs_to :invoice

      attr_accessible :description, :value
    end

Now, let's create an invoice.

    invoice = Invoice.new
    invoice.items = [Item.new(description: "Cheese", value: 0.40),
      Item.new(description: "Shipping fee to the Moon", value: 217.38)]
    invoice.save!

ActiveRecord assembles the objects **in memory**, and when I call
`invoice.save!` it starts a transaction, validates everything, writes
all the stuff to the database and then commits it.

    BEGIN TRANSACTION;
    INSERT INTO invoices SET user_id = NULL;
    INSERT INTO items SET invoice_id = 1, description = 'Cheese', value = 0.40;
    INSERT INTO items SET invoice_id = 1, description = 'Shipping fee to the moon', value = 217.38;
    COMMIT;

Now, let's assume I just found out, that shipping to the moon is less
expensive nowadays. So I need to edit the invoice. Because such things
happen quite often, I created a nice web interface in my rails app to
edit invoices. Imagine there is some controller action that takes the new
invoice data.

Because I never access any item directly without it's invoice, I do not
care about the primary keys of the items. I just delete them all and
then create new one. So let's try this out.

    invoice = Invoice.find(1)
    invoice.items = [Item.new(description: "Cheese", value: 0.40),
      Item.new(description: "Shipping fee to the Moon", value: 42.23)]
    invoice.save!

Whoops. What ActiveRecord did in the background is not quite what I
expected.


    BEGIN TRANSACTION;
    DELETE FROM items WHERE invoice_id = 1;
    COMMIT;
    BEGIN TRANSACTION;
    INSERT INTO items SET invoice_id = 1, description = 'Cheese', value = 0.40;
    INSERT INTO items SET invoice_id = 1, description = 'Shipping fee to the moon', value = 42.23;
    COMMIT;

It did not wrap the `DELETE` statement in the same transaction as the
`INSERT` statements. But why? Because that is not the way ActiveRecord
associations work.  ActiveRecord updates the keys on assignment, but
only when they are available. What does that mean? Let me show you some
examples.

    invoice       = Invoice.new     # => No SQL query executed.
    item          = Item.new        # => No SQL query executed.
    invoice.items = [item]          # => No SQL query executed.

    invoice       = Invoice.create  # => INSERT INTO invoices ...
    item          = Item.new        # => No SQL query executed.
    invoice.items = [item]          # => No SQL query executed.

    invoice       = Invoice.create  # => INSERT INTO invoices ...
    item          = Item.create     # => INSERT INTO items ...
    invoice.items = [item]          # => UPDATE items SET invoice_id ...

So when both models have a primary key available, ActiveRecord saves
them directly. Of course, if you assign an array of new items it can not
update the foreign keys of the new items, because the model is not saved
to the database. I can, however, nullify the keys of the old items - or
drop the items, when we set `:dependent => :destroy`.

This may be useful if you are using objects that do not depend on each
other, like users and blogposts. But an invoice does never exist without
its items and it would not be useful to query items without the
corosponding invoices.

## How do we get around this behavior?

So the first thing that came to my mind is using some ActiveRecord
features. It allows you to mark items as deleted and build new items on
associations. And when you call `save!`, it saves everything in one
transaction. Sounds fun, let's try this out.

    i = Invoice.find(1)
    i.items.each(&:mark_for_destruction!)
    i.items.build(description: 'Cheese', value: 0.40)
    i.items.build(description: 'Shipping', value: 23.42)
    i.save!

This worked. When the `save!` method is called, AR fires the following
queries:

    BEGIN TRANSACTION;
    DELETE FROM items WHERE id = ...;
    DELETE FROM items WHERE id = ...;
    INSERT INTO items SET invoice_id = 1, description = 'Cheese', value = 0.40;
    INSERT INTO items SET invoice_id = 1, description = 'Shipping', value = 23.42;
    COMMIT;

Ok. And now, let's add a `total` method to our invoice model, so we can
calculate the total value.

    class Invoice < ActiveRecord::Base
      # ...

      def total
        items.map(&:value).compact.reduce(:+) || 0.0
      end
    end

This just takes all the items, creates an array of the values, removes
all the nil values (`compact`), sums them up and, in case the array
happens to be empty and the result is nil, it returns `0.0` as the sum.

Let's also add a `before_save` callback that informs the customer her
invoice has been changed.


    class Invoice < ActiveRecord::Base
      # ...

      before_save do
        CustomerNotifier.invoice_updated(:new_total => self.total)
      end
    end

Ooops. This will result in lots of angry mails. Because in the
`before_save` hook, the price will be twice as high as it should be.
Because `total` also sums up the items that are marked for deletion.
Whoops. Let's fix this.

    class Invoice < ActiveRecord::Base
      # ...

      def items
        super.reject(&:marked_for_destruction?)
      end
    end

You immediatly doubled the amount of angry mails. Oh noez. What
happend this time? A look at the SQL log shows nothing good.

    BEGIN TRANSACTION;
    INSERT INTO items SET invoice_id = 1, description = 'Cheese', value = 0.40;
    INSERT INTO items SET invoice_id = 1, description = 'Shipping', value = 23.42;
    COMMIT;

The `DELETE` statements are missing. This means, the Users get the
correct total value in their mails. But when the payment backend loads
the invoice again, it still contains the old items. And the customers
get charged twice as much. Why does this happen? Because ActiveRecord
uses the `Invoice#items` method to determine which items are marked for
destruction. So if we remove them by overriding the method, they do not
get deleted. At this point, I finally considered ActiveRecord to be
broken by design.

I could fix this by replacing the code in my total value calculation, as
well as in the mailer that sends out the items listing, and oh, don't
forget the web frontend that is used to edit the invoices. But this
would not be dry. After some googling and a few questions on
stackoverflow, I found an extremely ugly way to work around this.

## The worst code ever.

    class Invoice < ActiveRecord::Base
      # ...

      def items
        if caller(0).select{|x| x =~ /activerecord-3/}.any?
          super
        else
          super.reject(&:marked_for_destruction?)
        end
      end
    end

**This is evil.** To further spread this ugly piece of extremly rotten
code, I recently released it as a gem. It's called
[activerecord-embedding](https://github.com/iblue/activerecord-embedding). [See also](http://events.ccc.de/congress/2005/fahrplan/events/598.en.html) (Warning: *zee Germans*).

It tries to implement the kind of things
[MongoMapper](https://github.com/jnunemaker/mongomapper) allows to do.
You just...

    class Invoice
      include MongoMapper::Document
      many :items
    end

    class Item
      include MongoMapper::EmbeddedDocument
    end

...and you are done. It exactly does the thing it should do.
Unfortuanetly this is bases uses MongoDB, which is way to fancy - at least for
some people. So I tried out various ORMs and some alternative databases.
I will write another article about it later.









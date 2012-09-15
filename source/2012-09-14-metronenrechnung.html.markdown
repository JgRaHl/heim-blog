---
title: Metronenrechnung, Teil 1
date: 2012-09-14 00:08 +02:00
tags:
---

# Einführung in die Metronenrechnung, Teil 1

Burkhard Heim verwendet in seiner Quantenfeldtheorie die
Metronenrechnung, in die ich eine kleine Einführung geben möchte.

## Was ist Metronenrechnung?

In der normalen Infinitesimalrechnung, also der Differential- und
Integralrechnung, wird untersucht, wie sich Funktionen auf unendlich
kleinen Abschnitten verhalten. Eines von Heims Ausgangsaxiomen ist, dass
es so etwas wie unendlich kleine Abschnitte nicht gibt, da Raum und Zeit
gequantelt seien, sich also nicht beliebig teilen lassen. Tatsächlich
gibt es Längen wie die Plancksche Länge, die die minimale Länge
festlegen, die es im Raum geben kann. Kleinere Objekte sind nicht
möglich. Der Ansatz erscheint also sinnvoll. 

Daraus ergibt sich allerdings auch, dass die normale
Differentialrechnung im Mikrobereich keine Gültigkeit mehr hat. Denn bei
der normalen Infinitesimalrechnung wird immer ein Grenzwert gebildet,
bei dem Variablen gegen unendlich kleine Größen gehen, also gegen Null.

## Ein Beispiel

Gegeben sei eine simple Funktion $f(x) = x^2$. Wenn wir nun wissen
wollen, welche Steigung die Tangente der Funktion in einem gewissen
Bereich hat, bilden wir die Ableitung.

$$f'(x) = \frac{df}{dx} = 2x$$

Die Funktion zeigt aber auch gleichzeitig die Änderungsrate im Punkt $x$
an.

Nehmen wir nun an, die Funktion gelte nur für den Bereich der
ganzen Zahlen ($0,1, 2, 3, ...$). Wenn wir nun die Werte für die
Funktion berechnen, erhalten wir die Quadratzahlen.

<table class="table">
  <thead><tr><td>$x$</td><td>$f(x)$</td></tr></thead>
  <tbody><tr><td>$0$</td><td>$0$</td></tr></tbody>
  <tbody><tr><td>$1$</td><td>$1$</td></tr></tbody>
  <tbody><tr><td>$2$</td><td>$4$</td></tr></tbody>
  <tbody><tr><td>$3$</td><td>$9$</td></tr></tbody>
  <tbody><tr><td>$4$</td><td>$16$</td></tr></tbody>
</table>

Man sieht, die Differenz zwischen einer Zahl und ihrem Vorgänger ist
immer $2x-1$. Wir nennen diese Differenz, also die Differenz zwischen
einer Zahl und ihrem Vorgänger nun das <i>Metrondifferential</i>. Die
Funktion nennen wir eine <i>Metronische Funktion</i>, in der Heimschen
Theorie wird diese meist mit dem Funktionsnamen $\phi$ und dem Argument
$n$ benannt. Es sei also $\phi(n)=n^2$.

## Bildung des Metrondifferential

Das <i>Metrondifferential</i> einer <i>metronischen Funktion</i> bildet
sich wie folgt.

$$\eth\phi = \phi(n) - \phi(n-1)$$.

Heim verwendet anstatt des Differentialoperators $d$ aus der
Infinitesimalrechnung oder des $\partial$ aus der partiellen Ableitung
in der Infinitesimalrechnung ein Quergestrichenes $\partial$, das
$\eth$, den <i>Metrondifferentialoperator</i>.

Somit können wir also auch ganz einfach das Metrondifferential 
von $\phi(n) = n^2$ herleiten: $ \eth\phi = \phi(n) - \phi(n-1) = 
n^2 - (n - 1)^2 = n^2 - (n^2 - 2n + 1) = n^2 - n^2 + 2n - 1 = 2n - 1$

## Bildung des Metronintegrals

Ebenfalls revidiert werden muss dann natürlich auch das infinitesimale
Integral, das ebenso mit infinitesimalen Werten rechnet. Der Grund lässt
sich leicht zeigen. Berechnen wir zunächst das normale Integral zu
einer normalen Funktion $f(x) = x^2$:

$$\int\limits_{x_1}^{x_2} f(x) dx = F(x_2) - F(x_1)$$

Dabei ist $F$ die Stammfunktion für die gilt $\frac{dF}{dx} = f(x)$.
Wenn wir also die Ableitung der Stammfunktion bilden, sollte wieder
unsere gegebene Funktion rauskommen. Im unserem Falle lässt sich die
Stammfunktion gut bestimmen. $$F(x) = \frac{1}{3}x^3 + c$$. Dabei steht
$c$ für eine beliebige Konstante, die bei der Ableitung der
Stammfunktion wieder verschwindet, aber auch sich im Integral
herausrechnet.

Gleichermaßen muss dann auch für das Metroninteral eine Stammfunktion
existieren, deren Metrondifferential dann wieder zur Ausgangsfunktion
führen. Heim verwendet dafür eine großes fettgedrucktes
$\boldsymbol{S}$. Es gilt:

$$\boldsymbol{S}_{n_1}^{n_2} \phi(x) \eth n = \Phi(n_2) - \Phi(n_1 - 1)$$

<i>(Leider ist der Textsatz hier beschränkt, korrekt müssten die
Integrationsgrenzen über und unter dem $\boldsymbol{S}$ geschrieben
werden)</i>

Dabei ist $\Phi$ die <i>metronische Stammfunktion</i> zu $\phi$. Es
gilt:

$$\eth\Phi = \phi$$

Das Metrondifferential zur Stammfunktion ergibt also wieder die
Ausgangsfunktion. Es lässt sich zeigen, dass die metronische
Stammfunktion ganz anders aussieht, als die infinitesimale
Stammfunktion. Die Stammfunktion zu $\phi(n) = n^2$ ist nämlich nicht
$\frac{1}{3}n^3$, sondern

$$\Phi(n) = \frac{2n^3 - 3n^2 + n}{6}$$.

Bildet man davon das Metrondifferential, erhält man also wieder die
ursprüngliche Funktion. Damit lassen sich nun also die Summen der
Quadratzahlen in den Integrationsgrenzen bestimmen. Möchte man z.B. die
Summe von $1^2 + 2^2 + 3^2 + 4^2 + 5^2$ berechnen, setzt man einfach
$n=6$ (es muss $1$ addiert werden, weil die letzte Grenze um eins
vermindert wird) in die Gleichung ein und erhält die korrekte Summe
$55$.

Rechenvorschriften und eine genauere Ausarbeitung dann im nächsten
Artikel.

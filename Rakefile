SSH_USER = 'iblue'
SSH_HOST = 'serv9.deepmagic.de'
SSH_DIR  = '/var/www/heim-projekt'

desc "Build the website from source"
task :build do
  puts "## Building website"
  status = system("middleman build --clean")
  puts status ? "OK" : "FAILED"
end

desc "Run the preview server at http://localhost:4567"
task :preview do
  system("middleman server")
end

desc "Deploy website via rsync"
task :push do
  puts "## Deploying website via rsync to #{SSH_HOST}"
  status = system("rsync -avze 'ssh' --delete build/ #{SSH_USER}@#{SSH_HOST}:#{SSH_DIR}")
  puts status ? "OK" : "FAILED"
end

desc "Deploy config"
task :config do
  puts "## Deploying nginx config to #{SSH_HOST}"
  system("rsync -avze 'ssh' nginx.conf root@#{SSH_HOST}:/etc/nginx/sites-available/heim-projekt")
  system("ssh root@#{SSH_HOST} '/etc/init.d/nginx reload'")
end

desc "Build and deploy website"
task :deploy => [:build, :push] do
end

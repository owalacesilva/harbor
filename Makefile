# Define required macros here

dbsetup:
	rake db:setup && rake db:migrate && rake db:seed

dbrenew:
	rake db:drop && rake db:create && rake db:migrate && rake db:seed

deploy:
	bundle exec cap production deploy

up:
	RAILS_ENV=development bash ./server.sh

guard:
	bundle exec guard

console:
	bundle exec rails console --no-sandbox

sandbox:
	bundle exec rails console --sandbox

ssh-agent:
	eval `ssh-agent` && ssh-add ~/.ssh/github_rsa

# Define required macros here

dbrenew:
	rake db:drop && rake db:create && rake db:migrate && rake db:seed

deploy:
	bundle exec cap production deploy

up:
	RAILS_ENV=development bash ./server.sh

dbsetup:
	rake db:setup && rake db:migrate && rake db:seed

# Morpheus

A set of rake tasks to automate interacting with Heroku.

## Assumptions

This gem relies heavily on bash for interacting with Heroku. It's assuming you have the `Heroku CLI`
installed and `curl`. Your session must be authenticated with heroku (i.e. running `heroku logs` works).



## Fetch a PG backup from Heroku

Morpheus will fetch the latest pg backup. If there is no backup, then it will create one. It is
strongly recommended to set a recurring Heroku backup. https://devcenter.heroku.com/articles/heroku-postgres-backups#scheduling-backups

`$ bundle exec rake db:fetch`

## Load a PG backup

`$ bundle exec rake db:load`

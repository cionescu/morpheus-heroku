namespace :db do
  desc 'Load a production db into dev'
  task load: :environment do
    MorpheusHeroku.fetch
    MorpheusHeroku.load
  end

  desc 'Fetch the latest backup db from Heroku'
  task fetch: :environment do
    MorpheusHeroku.fetch
  end
end

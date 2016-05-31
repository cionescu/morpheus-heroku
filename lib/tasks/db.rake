namespace :db do
  desc 'Load a production db into dev'
  task load: :environment do
    Morpheus.fetch
    Morpheus.load
  end

  desc 'Fetch the latest backup db from Heroku'
  task fetch: :environment do
    Morpheus.fetch
  end
end

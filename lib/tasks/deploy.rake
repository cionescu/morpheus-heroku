namespace :deploy do
  desc 'Load a production db into dev'
  task staging: :environment do
    Morpheus.deploy(:staging)
  end

  desc 'Fetch the latest backup db from Heroku'
  task production: :environment do
    Morpheus.deploy(:production)
  end
end

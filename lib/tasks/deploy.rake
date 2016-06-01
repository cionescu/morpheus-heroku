namespace :deploy do
  desc 'Deploy current branch onto Heroku Master'
  task production: :environment do
    Morpheus.deploy(:production)
  end
end

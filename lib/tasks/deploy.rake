namespace :deploy do
  desc 'Deploy current branch onto Heroku Master'
  task production: :environment do
    MorpheusHeroku.deploy(:production)
  end
end

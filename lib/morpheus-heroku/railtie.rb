module MorpheusHeroku
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/db.rake"
      load "tasks/deploy.rake"
    end
  end
end

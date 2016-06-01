module Morpheus
  module Load
    extend self

    def run
      ensure_db_environment! if Rails.env.development?
      drop_database!
      create_database!
      load_database!
    end

    private

    def ensure_db_environment!
      Helper.bash_run(command: "bundle exec rake db:environment:set RAILS_ENV=development")
    end

    def drop_database!
      Rake::Task["db:drop"].invoke
    end

    def create_database!
      Rake::Task["db:create"].invoke
    end

    def load_database!
      Helper.bash_run(command: "pg_restore -O -n public -d #{Morpheus.configuration.database_name} #{Morpheus.configuration.backup_location}")
    end
  end
end

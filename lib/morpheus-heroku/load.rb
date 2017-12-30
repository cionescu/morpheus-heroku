module MorpheusHeroku
  module Load
    extend self

    def run
      ensure_db_environment! if Rails.env.development?
      drop_active_connections!
      drop_database!
      create_database!
      load_database!
    end

    private

    def drop_active_connections!
      sql_command = <<~SQL
        SELECT pid, pg_terminate_backend(pid)
        FROM pg_stat_activity
        WHERE datname = current_database()
          AND pid <> pg_backend_pid();
      SQL
      Helper.bash_run(command: "psql -d seriesreminder_development -c '#{sql_command}'")
    end

    def ensure_db_environment!
      Helper.bash_run(command: "bundle exec rake db:environment:set RAILS_ENV=development")
    end

    def drop_database!
      Helper.logger("Rake::Task['db:drop']")
      Rake::Task["db:drop"].invoke
    end

    def create_database!
      Helper.logger("Rake::Task['db:create']")
      Rake::Task["db:create"].invoke
    end

    def load_database!
      Helper.bash_run(command: "pg_restore -O -n public -d #{MorpheusHeroku.configuration.database_name} #{MorpheusHeroku.configuration.backup_location}")
    end
  end
end

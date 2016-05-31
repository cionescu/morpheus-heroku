module Morpheus
  module Load
    extend self

    def run
      drop_database!
      create_database!
      load_database!
    end

    private

    def drop_database!
      Rake::Task["db:drop"].invoke
    end

    def create_database!
      Rake::Task["db:create"].invoke
    end

    def load_database!
      Helper.run(command: "pg_restore -O -n public -d #{Morpheus.configuration.database_name} #{Morpheus.configuration.backup_location}")
    end
  end
end

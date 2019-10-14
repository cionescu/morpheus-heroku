module MorpheusHeroku
  module Fetch
    extend self

    def run
      generate_backup!
      download_backup!
    end

    private

    def generate_backup!
      Helper.heroku_run(command: "heroku pg:backups capture")
    end

    def download_backup!
      prepare_location
      Helper.bash_run(command: "curl -o #{MorpheusHeroku.configuration.backup_location} `heroku pg:backups public-url`")
    end

    def prepare_location
      location = MorpheusHeroku.configuration.backup_location

      return if File.writable?(location)

      create_dir(location[/^.+(?=\/)/])
      create_file(location[/(?<=\/).+$/])      
    end

    def create_dir(dir_name)
      return if Dir.exist?(dir_name)

      Helper.bash_run(command: "mkdir #{dir_name}")
    end

    def create_file(file_name)
      return if File.exist?(file_name)

      Helper.bash_run(command: "touch #{file_name}")
    end
  end
end

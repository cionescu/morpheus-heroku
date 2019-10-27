module MorpheusHeroku
  module Fetch
    extend self

    delegate :backup_location, :app_name, to: 'MorpheusHeroku.configuration'

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
      Helper.bash_run(command: "curl -o #{backup_location} `heroku pg:backups public-url -a #{app_name}`")
    end

    def prepare_location
      return if File.writable?(backup_location)

      create_dir(backup_location[/^.+(?=\/)/])
      create_file(backup_location[/(?<=\/).+$/])
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

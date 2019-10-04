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
      prepare_location()
      Helper.bash_run(command: "curl -o #{MorpheusHeroku.configuration.backup_location} `heroku pg:backups public-url`")
    end

    def prepare_location
      location = MorpheusHeroku.configuration.backup_location
      unless File.writable?(location)
        prepare_dir(location[/^.+(?=\/)/])
        prepare_file(location[/(?<=\/).+$/])
      end
    end

    def prepare_dir(dir_name)
      unless Dir.exist?(dir_name)
        Helper.bash_run(command: "mkdir #{dir_name}")
      end
    end

    def prepare_file(file_name)
      unless File.exist?(file_name)
        Helper.bash_run(command: "touch #{file_name}")
      end
    end
  end
end

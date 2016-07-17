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
      Helper.bash_run(command: "curl -o #{MorpheusHeroku.configuration.backup_location} `heroku pg:backups public-url`")
    end
  end
end

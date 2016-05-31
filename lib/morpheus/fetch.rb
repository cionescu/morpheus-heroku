module Morpheus
  module Fetch
    extend self

    def run
      unless backup_available?
        Rails.logger.info "No backup available. Generating one"
        generate_backup!
      end
      download_backup!
    end

    private

    def backup_available?
      Heroku.run(command: "heroku pg:backups public-url")
    end

    def generate_backup!
      Heroku.run(command: "heroku pg:backups capture")
    end

    def backup_url
      Heroku.run(command: "heroku pg:backups public-url")
    end

    def download_backup!
      Heroku.run(command: "curl -o #{Config.backup_location} `heroku pg:backups public-url`")
    end
  end
end

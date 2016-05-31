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
      Helper.run(command: "heroku pg:backups public-url")
    end

    def generate_backup!
      Helper.run(command: "heroku pg:backups capture")
    end

    def backup_url
      Helper.run(command: "heroku pg:backups public-url")
    end

    def download_backup!
      Helper.run(command: "curl -o #{Morpheus.configuration.backup_location} `heroku pg:backups public-url`")
    end
  end
end

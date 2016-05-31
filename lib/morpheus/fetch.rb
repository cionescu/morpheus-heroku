require 'fileutils'
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
      Heroku.heroku_run(command: "heroku pg:backups public-url")
    end

    def generate_backup!
      Heroku.heroku_run(command: "heroku pg:backups capture")
    end

    def backup_url
      Heroku.heroku_run(command: "heroku pg:backups public-url")
    end

    def download_backup!
      Heroku.heroku_run(command: "curl -o tmp/latest.dump `heroku pg:backups public-url`")
    end
  end
end

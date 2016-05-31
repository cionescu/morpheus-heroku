module Morpheus
  module Heroku
    def self.heroku_run(command: "")
      Rails.logger.info "*MORPHEUS* Running command *#{command}*"
      Bundler.with_clean_env do
        system(command) || abort("\n== Command #{command} failed ==")
      end
    end
  end
end

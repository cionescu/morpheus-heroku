module Morpheus
  module Heroku
    def self.run(command: "")
      puts "*MORPHEUS* Running command *#{command}*. RAILS_ENV: #{Rails.env}"
      Bundler.with_clean_env do
        system(command) || abort("\n== Command #{command} failed ==")
      end
    end
  end
end

module Morpheus
  module Helper
    extend self

    def run(command: "")
      Helper.logger(command)
      Bundler.with_clean_env do
        system(command) || abort("\n== Command #{command} failed ==")
      end
    end

    def logger(message = "")
      if Morpheus.configuration.log_events
        puts "<MORPHEUS> Running: *#{command}*. RAILS_ENV: #{Rails.env} </MORPHEUS>"
      end
    end
  end
end

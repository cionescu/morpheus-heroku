module Morpheus
  module Helper
    extend self

    def heroku_run(command: "")
      if Morpheus.configuration.app_name.present?
        command += " --app #{Morpheus.configuration.app_name}"
      end
      generic_run(command)
    end

    def bash_run(command: "")
      self.generic_run(command)
    end

    def generic_run(command)
      Helper.logger(command)
      Bundler.with_clean_env do
        system(command) || abort("\n== Command #{command} failed ==")
      end
    end

    def logger(message = "")
      if Morpheus.configuration.log_events
        puts "<MORPHEUS> Running: *#{command}*. RAILS_ENV: #{Rails.env}. APP_NAME: #{Morpheus.configuration.app_name} </MORPHEUS>"
      end
    end
  end
end

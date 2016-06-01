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
        puts "<MORPHEUS>".text_red
        puts "Running: #{message}".text_green
        puts "RAILS_ENV: #{Rails.env}".text_green
        puts "APP_NAME: #{Morpheus.configuration.app_name}".text_green
        puts "</MORPHEUS>".text_red
      end
    end
  end
end

class String
  def text_red;            "\e[31m#{self}\e[0m" end
  def text_green;          "\e[32m#{self}\e[0m" end
end
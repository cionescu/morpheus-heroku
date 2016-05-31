module Morpheus
  class Config
    attr_accessor :database_name, :backup_location, :app_name, :log_events

    def initialize
      @database_name = ActiveRecord::Base.connection_config[:database]
      @backup_location = "tmp/latest.dump"
      @log_events = false
    end
  end
end

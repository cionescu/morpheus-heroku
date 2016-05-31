module Morpheus
  class Config
    attr_accessor :database_name, :backup_location, :app_name

    def initialize
      @database_name = ActiveRecord::Base.connection_config[:database]
      @backup_location = "tmp/latest.dump"
    end
  end
end

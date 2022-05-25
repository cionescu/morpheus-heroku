module MorpheusHeroku
  class Config
    attr_accessor :database_name, :backup_location, :app_name, :log_events, :dev_email

    def initialize
      @database_name = if ActiveRecord::Base.respond_to?(:connection_config)
        ActiveRecord::Base.connection_config[:database].dup
      elsif ActiveRecord::Base.respond_to?(:connection_db_config)
        ActiveRecord::Base.connection_db_config.configuration_hash[:database].dup
      end
      @backup_location = "tmp/latest.dump"
      @log_events = false
    end
  end
end

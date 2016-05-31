module Morpheus
  module Config
    extend self

    def database_name
      "foggy_development"
    end

    def backup_location
      "tmp/latest.dump"
    end
  end
end

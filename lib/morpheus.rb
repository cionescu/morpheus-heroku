require 'morpheus/fetch'
require 'morpheus/load'
require 'morpheus/deploy'

require 'morpheus/helper'
require 'morpheus/config'

require 'morpheus/railtie'

module Morpheus
  class << self
    attr_accessor :configuration
  end

  class NotImplemented < StandardError; end

  extend self

  def fetch
    Morpheus::Fetch.run
  end

  def load
    Morpheus::Load.run
  end

  def deploy(environment = :production)
    if environment == :production
      Morpheus::Deploy.production
    elsif environment == :staging
      raise NotImplemented, "Morpheus doesn't support deploying to staging yet!"
    end
  end

  def self.configure
    self.configuration ||= Config.new
    yield(configuration)
  end
end

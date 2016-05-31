require 'morpheus/fetch'
require 'morpheus/load'

require 'morpheus/heroku'
require 'morpheus/config'

require 'morpheus/railtie'

module Morpheus
  class << self
    attr_accessor :configuration
  end

  extend self

  def fetch
    Morpheus::Fetch.run
  end

  def load
    Morpheus::Load.run
  end

  def self.configure
    self.configuration ||= Config.new
    yield(configuration)
  end
end

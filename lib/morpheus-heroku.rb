require 'morpheus-heroku/fetch'
require 'morpheus-heroku/load'
require 'morpheus-heroku/deploy'

require 'morpheus-heroku/helper'
require 'morpheus-heroku/config'

require 'morpheus-heroku/railtie'

module MorpheusHeroku
  class << self
    attr_accessor :configuration
  end

  class NotImplemented < StandardError; end

  extend self

  def fetch
    MorpheusHeroku::Fetch.run
  end

  def load
    MorpheusHeroku::Load.run
  end

  def deploy(environment = :production)
    if environment == :production
      MorpheusHeroku::Deploy.production
    elsif environment == :staging
      raise NotImplemented, "MorpheusHeroku doesn't support deploying to staging yet!"
    end
  end

  def self.configure
    self.configuration ||= Config.new
    yield(configuration)
  end
end

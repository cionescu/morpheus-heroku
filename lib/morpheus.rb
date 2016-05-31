require 'morpheus/fetch'
require 'morpheus/load'

require 'morpheus/heroku'
require 'morpheus/config'

require 'morpheus/railtie'

module Morpheus
  extend self

  def fetch
    Morpheus::Fetch.run
  end

  def load
    Morpheus::Load.run
  end
end

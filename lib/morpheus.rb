require 'morpheus/fetch'
require 'morpheus/heroku'

require 'morpheus/railtie'

module Morpheus
  extend self

  def fetch
    Morpheus::Fetch.run
  end
end

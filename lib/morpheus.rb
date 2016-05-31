require 'morpheus/fetch'
require 'morpheus/heroku'

module Morpheus
  extend self

  def fetch
    Morpheus::Fetch.run
  end
end

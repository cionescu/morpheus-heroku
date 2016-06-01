class MorpheusHerokuGenerator < Rails::Generators::Base
  source_root File.expand_path("../../../", __FILE__)

  desc "Generate an initializer"
  def create_initializer_file
    copy_file "config/morpheus-heroku-initializer.rb", "config/initializers/morpheus-heroku.rb"
  end
end

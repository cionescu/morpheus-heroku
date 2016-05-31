class MorpheusGenerator < Rails::Generators::Base
  source_root File.expand_path("../../../", __FILE__)

  desc "Generate an initializer"
  def create_initializer_file
    copy_file "config/morpheus-initializer.rb", "config/initializers/morpheus.rb"
  end
end

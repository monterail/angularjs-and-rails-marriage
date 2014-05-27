class Sprockets::DirectiveProcessor
  def process_depend_on_config_directive(file)
    path = File.expand_path(file, Rails.root.join('config'))
    context.depend_on(path)
  end
end

Rails.application.assets.register_mime_type 'text/html', '.html'
Rails.application.assets.register_engine '.slim', Slim::Template

Rails.application.assets.register_mime_type 'application/json', '.json'
Rails.application.assets.register_preprocessor 'application/json', Sprockets::DirectiveProcessor

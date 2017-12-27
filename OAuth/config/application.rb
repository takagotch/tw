class Application < Rails:Application
  config.autoload_paths += %W(#{config.root}/lib)
  config.autoload_paths += Dir["#{config.root}/lib/**/"]
end


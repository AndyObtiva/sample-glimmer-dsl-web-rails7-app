Rails.application.configure do
  config.assets.excluded_paths << Rails.root.join('app/assets/opal')
end

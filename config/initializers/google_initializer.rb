google = "#{Rails.root}/config/google.yml"
if File.exists? google
  config = YAML.load_file(google)
  config.each { |key, value| ENV[key] || ENV[key] = value.to_s }
end

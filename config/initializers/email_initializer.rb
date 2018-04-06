email = "#{Rails.root}/config/email.yml"
if File.exists? email
  config = YAML.load_file(email)
  config.each { |key, value| ENV[key] || ENV[key] = value.to_s }
end

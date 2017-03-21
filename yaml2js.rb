require 'yaml'
require 'json'

YAML_FILE = 'reference.yml'

content = YAML::load(File.open(YAML_FILE, 'r') { |f| f.read })

puts content.to_json

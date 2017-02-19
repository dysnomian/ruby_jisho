require 'bundler/setup'
require 'jisho'
require 'json'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def load_fixture(name:, parse: true)
  content = File.read("spec/fixtures/#{name}.json")

  return content unless parse

  unless content.nil? || content == ''
    return JSON.parse(content, symbolize_names: true)
  end
rescue
  raise "The #{name} fixture couldn't be found."
end

require 'psych'
require 'open-uri'

module Battletoads
  class Parser

    attr_reader :file_path, :parsed_plugins

    def initialize(file_path)
      @file_path = file_path
      @parsed_plugins = []
    end

    def parse
      data = Psych.load_file(file_path)
      data['plugins'].each do |name, plugin_data|
        binding.pry
        _data = plugin_data
        if plugin_data.is_a? String
          open(plugin_data, 'r') do |f|
            _data = Psych.load(f.read)
          end
        end
        @parsed_plugins << create_plugin(_data)
      end

      @parsed_plugins
    end

    private

    def create_plugin(plugin_data)
      opts = {
        examples: plugin_data['examples'],
        name:     plugin_data['name'],
        base:     plugin_data['base'],
        postcss_arguments: plugin_data['postcss_arguments']
      }
      Battletoads::Plugin.new(opts)
    end

  end
end

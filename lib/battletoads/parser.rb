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
        styles:   plugin_data['styles'].map { |st| parse_style st },
        examples: plugin_data['examples'].map { |ex| parse_example ex },
        name:     plugin_data['name'],
        postcss_arguments: plugin_data['postcss_arguments']
      }
      Battletoads::Plugin.new(opts)
    end

    def parse_style(style_data)
    end

    def parse_example(example_data)
    end

  end
end

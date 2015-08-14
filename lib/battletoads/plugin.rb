module Battletoads
  class Plugin

    attr_accessor :name, :postcss_arguments, :styles, :examples

    def initialize(opts)
      @name              = opts['name']
      @postcss_arguments = opts['postcss_arguments']
      @styles            = opts['styles'] || []
      @examples          = opts['examples'] || []
    end

    def escaped_name
      "\"#{name}\""
    end

  end
end

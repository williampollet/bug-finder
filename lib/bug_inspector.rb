require 'bug_inspector/configuration'
require 'http'
require 'yaml'
require 'bug_inspector/version'

module BugInspector
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end

  class Error < StandardError; end
end

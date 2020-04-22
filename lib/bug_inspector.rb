require 'bug_inspector/configuration'
require 'http'
require 'yaml'
require 'json'
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

    def list(method:, exception:, since: Time.now.to_i - 604800, limit: 200, count_only: false)
      JSON.parse(HTTP.get(
        configuration.list_errors_url,
        params: {
          action_id: method.gsub('#', '-hash-'),
          exception: exception,
          since: since,
          limit: limit,
          count_only: count_only,
        },
      ).to_s)['log_entries']
    end

    def find(error_id)
      JSON.parse(
        HTTP.get(
          "https://appsignal.com/api/#{configuration.app_id}/samples/#{error_id}.json",
          params: {
            token: configuration.token
          }
        ).to_s
      )
    end
  end

  class Error < StandardError; end
end

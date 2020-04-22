module BugInspector
  class Configuration
    attr_accessor :app_id, :token

    def initialize
      @app_id = application_config['app_id']
      @token = application_config['token']
    end

    def errors_url
      "https://appsignal.com/api/#{app_id}/samples/errors.json?token=#{token}"
    end

    private

    def application_config
      return YAML.load_file('inspector.yml') if File.exist?('inspector.yml')

      {}
    end
  end
end

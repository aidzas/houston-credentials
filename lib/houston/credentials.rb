require "houston/credentials/engine"
require "houston/credentials/configuration"

module Houston
  module Credentials
    extend self

    def config(&block)
      @configuration ||= Credentials::Configuration.new
      @configuration.instance_eval(&block) if block_given?
      @configuration
    end

  end



  # New Extensions

  @credentials_services = {}

  def self.accept_credentials_for(service, &test_connection_proc)
    @credentials_services[service] = test_connection_proc
  end

  def self.user_credentials_support_services
    @credentials_services.keys
  end

  def self.test_connection_to(credentials)
    login = credentials.login
    password = credentials.password.decrypt(Houston::Credentials.config.passphrase)
    errors = credentials.errors
    @credentials_services[credentials.service].call(login, password, errors)
  end



  # Extension Points
  # ===========================================================================
  #
  # Read more about extending Houston at:
  # https://github.com/houston/houston-core/wiki/Modules

  add_user_option "credentials.list" do
    name "Credentials"
    html do |f|
      html = <<-HTML
        <p>
          Houston has remembered your credentials for:
        </p>

        <ul class="user-credentials">
      HTML
      @user.credentials.each do |credentials|
        html << <<-HTML
          <li id="user_credentials_#{credentials.id}">
            <span class="user-credentials-service">#{credentials.service}</span>
            <span class="user-credentials-delete">
              <a class="btn btn-mini btn-danger delete-user-credentials" href="/credentials/#{credentials.id}" data-method="delete" data-confirm="Should Houston forget your credentials for #{credentials.service}?">Delete</a>
            </span>
          </li>
        HTML
      end
      html << "</ul>"
    end
  end

end

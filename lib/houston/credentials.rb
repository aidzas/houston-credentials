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


  # Extension Points
  # ===========================================================================
  #
  # Read more about extending Houston at:
  # https://github.com/houston/houston-core/wiki/Modules


  # Register events that will be raised by this module
  #
  #    register_events {{
  #      "credentials:create" => params("credentials").desc("Credentials was created"),
  #      "credentials:update" => params("credentials").desc("Credentials was updated")
  #    }}


  # Add a link to Houston's global navigation
  #
  #    add_navigation_renderer :credentials do
  #      name "Credentials"
  #      path { Houston::Credentials::Engine.routes.url_helpers.credentials_path }
  #      ability { |ability| ability.can? :read, Project }
  #    end


  # Add a link to feature that can be turned on for projects
  #
  #    add_project_feature :credentials do
  #      name "Credentials"
  #      path { |project| Houston::Credentials::Engine.routes.url_helpers.project_credentials_path(project) }
  #      ability { |ability, project| ability.can? :read, project }
  #    end

end

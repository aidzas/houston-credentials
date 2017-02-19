require "houston/credentials/application_controller_ext"
require "houston/credentials/user_ext"

module Houston
  module Credentials
    class Railtie < ::Rails::Railtie

      # The block you pass to this method will run for every request
      # in development mode, but only once in production.
      config.to_prepare do
        ::User.send :include, Houston::Credentials::UserExt
        ::ApplicationController.send :include, Houston::Credentials::ApplicationControllerExt
      end

    end
  end
end

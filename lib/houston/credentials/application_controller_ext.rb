require "active_support/concern"

module Houston
  module Credentials
    module ApplicationControllerExt
      extend ActiveSupport::Concern

      included do
        rescue_from UserCredentials::MissingCredentials do
          head 401, "X-Credentials" => "Missing Credentials"
        end

        rescue_from UserCredentials::InvalidCredentials do
          head 401, "X-Credentials" => "Invalid Credentials"
        end

        rescue_from UserCredentials::InsufficientPermissions do |exception|
          render plain: exception.message, status: 401
        end
      end

    end
  end
end

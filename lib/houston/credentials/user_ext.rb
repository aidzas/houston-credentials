module Houston
  module Credentials
    module UserExt
      extend ActiveSupport::Concern

      included do
        has_many :credentials, class_name: "UserCredentials", dependent: :destroy
      end

    end
  end
end

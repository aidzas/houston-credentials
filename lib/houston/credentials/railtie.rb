module Houston
  module Credentials
    class Railtie < ::Rails::Railtie

      # The block you pass to this method will run for every request
      # in development mode, but only once in production.
      # config.to_prepare do
      #
      #   Add methods or relationships to a core model (like User)
      #   by including a module that adds the concern here:
      #   ::User.send :include, Houston::Credentials::UserExt
      # end

    end
  end
end

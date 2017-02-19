module Houston::Credentials
  class Configuration

    def passphrase(*args)
      @passphrase = args.first if args.any?
      @passphrase ||= nil
    end

    def keypair
      Houston.root.join("config", "keypair.pem")
    end

  end
end

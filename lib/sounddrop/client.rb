module SoundDrop
  class Client

    ###########################################################################
    #                                  Setup                                  #
    ###########################################################################

    attr_reader :client
    LOG = Logbert[self]

    def initialize(opts={})
      @CLIENT_ID     = opts.fetch(:client_id)
      @CLIENT_SECRET = opts.fetch(:client_secret)
      @USERNAME      = opts.fetch(:username, nil)
      @PASSWORD      = opts.fetch(:password, nil)
      @client        = get_client
    end

    ###########################################################################
    #                                  Core                                   #
    ###########################################################################

    # Did the user specify a username?
    def username?
      @USERNAME.nil?
    end

    # Did the user specify a password?
    def password?
      @PASSWORD.nil?
    end

    # Defines a Soundcloud client object
    def get_client
      init_opts = {
        client_id:     @CLIENT_ID,
        client_secret: @CLIENT_SECRET
      }

      if username? and password?
        init_opts[:username] = @USERNAME
        init_opts[:password] = @PASSWORD
      end

      Soundcloud.new(init_opts)
    end

    # Returns a Drop object that contains useful track information.
    def get_drop(url)
      sc_track = client.get('/resolve', url: url)
      SoundDrop::Drop.new(client: client, track: sc_track)
    end

    private :get_client, :username?, :password?

  end # class Client
end # module SoundDrop

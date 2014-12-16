module Sounddrop
  class Drop

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

    # Returns a Track object with all sorts of useful data with useful getters.
    # The Track object is where most of the data retrieval occurs.
    def get_track(url)
      sc_track = client.get('/resolve', url: url)
      Sounddrop::Track.new(sc_track, client)
    end

    private :get_client, :username?, :password?

  end # class Drop
end # module Sounddrop

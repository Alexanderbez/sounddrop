module SoundDrop
  class Drop

    ###########################################################################
    #                                  Setup                                  #
    ###########################################################################

    LOG = Logbert[self]

    def initialize(params)
      @TRACK  = params[:track]
      @CLIENT = params[:client]
    end

    ###########################################################################
    #                                  Core                                   #
    ###########################################################################

    # Track id
    def id
      @TRACK.id
    end

    # Track title
    def title
      @TRACK.title
    end

    # Track genre
    def genre
      @TRACK.genre
    end

    # Track media url
    def media_url
      begin
        r = HTTParty.get("https://api.soundcloud.com/i1/tracks/#{id}/streams?client_id=#{@CLIENT.client_id}")
        r['http_mp3_128_url']
      rescue Exception => ex
        raise SoundDrop::Exception::FailedRequest.new(ex)
      end
    end

  end # class Drop
end # module SoundDrop

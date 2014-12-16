module Sounddrop
  class Track

    ###########################################################################
    #                                  Setup                                  #
    ###########################################################################

    LOG = Logbert[self]

    def initialize(track_hash, client)
      @TRACK  = track_hash
      @CLIENT = client
    end

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
        raise Sounddrop::Exception::FailedRequest.new(ex)
      end
    end

  end # class Track
end # module Sounddrop

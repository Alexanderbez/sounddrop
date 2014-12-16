module Sounddrop::Exception

  class FailedRequest < StandardError
    attr_reader :message

    def initialize(message)
      @message = message
    end
  end

end # module Sounddrop::Exception

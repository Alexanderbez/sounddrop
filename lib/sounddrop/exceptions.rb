module SoundDrop
  module Exception

    class FailedRequest < StandardError
      attr_reader :message

      def initialize(message)
        @message = message
      end
    end

  end # module Exception
end # module SoundDrop

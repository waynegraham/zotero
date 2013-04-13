module Zotero

  class Error < StandardError
    attr_reader :http_headers

    def initialize(message, http_headers)
      @http_headers = http_headers
      super(message)
    end
  end # Error

  # Server errors
  class Error::ServerError        < Zotero::Error; end
  class Error::ServiceUnavailable < Zotero::Error; end

  # Client errors
  class Error::ClientError     < Zotero::Error; end
  class Error::Forbidden       < Error::ClientError; end
  class Error::BadRequest      < Error::ClientError; end
  class Error::RequesttooLarge < Error::ClientError; end

end

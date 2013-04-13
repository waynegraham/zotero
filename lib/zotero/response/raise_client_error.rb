require 'faraday'

module Zotero

  module Response
    
    class RaiseClientError < Faraday::Response::Middleware

      def on_complete(env)
        status  = env[:status].to_i
        body    = env[:body]
        headers = env[:response_headers]

        case status
        when 400
          raise Zotero::Error::BaseRequest.new body, headers
        when 403
          raise Zotero::Error::Forbidden.new body, headers
        when 413
          raise Zotero::Error::RequestTooLarge.new body, headers
        end
      end

    end # RaiseClientError

  end # Response
end

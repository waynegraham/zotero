require 'faraday'
require 'zotero/error'

module Zotero

  module Response

    class RaiseServerError < Faraday::Response::Middleware
      
      def on_complete(env)
        status  = env[:status].to_i
        headers = env[:response_headers]

        case status
        when 503
          raise Zotero::Error::ServiceUnavailable.new "503 No server available to handle this request.", headers
        end
      end

    end #RaiseServerError

  end # Response

end

require 'faraday'
require 'zotero/response/raise_client_error'
require 'zotero/response/raise_server_error'

module Zotero
  module Connection
    
    private

    def connection(options)
      default_options = {
        :url => options.fetch(:endpoint, endpoint)
      }

      @connection ||= Faraday.new(default_options) do |builder|
        builder.use Zotero::Response::RaiseClientError
        builder.use Zotero::Response::RaiseServerError

        # TODO: make logging optional
        # builder.response :logger

        builder.adapter adapter
      end
    end

  end # Connection
end

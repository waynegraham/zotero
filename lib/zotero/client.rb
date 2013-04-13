require 'zotero/connection'
require 'zotero/request'

module Zotero
  # Provides access to the Zotero API https://api.zotero.org
  #
  # Basic usage of the library is to call supported methods via the
  # Client class
  

  class Client
    include Zotero::Connection
    include Zotero::Request

    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options={})
      merged_options = Zotero.options.merge(options)
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end

    private

    # Configure parameters to be understood yb the Zotero API
    # ex: :api_key = 'apikey'
    def prepare_request_params(options)
      params = detect_request_input options.delete(:input)

      options.inject(params) do |params, kv|
        key, value = kv
        params.merge!("#{key.to_s.downcase.gsub(/_+/,'')}" => value) 
      end
    end

    def detect_request_input(input)
      if input =~ /^https?:\/\//
        { 'source' => input }
      else
        { 'inputtext' => input }
      end
    end

  end # Client

end

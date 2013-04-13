module Zotero
  module Configuration
    VALID_CONNECTION_KEYS = [:endpoint, :user_agent, :method].freeze
    VALID_OPTIONS_KEYS    = [:api_key, :format, :collection_key, :library_type, :library_id, :library_slug].freeze
    VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS

    DEFAULT_ENDPOINT      = "https://api.zotero.org"
    DEFAULT_METHOD        = :get
    DEFAULT_USER_AGENT    = "Zotero API Ruby Gem #{Zotero::VERSION}".freeze
    DEFAULT_COLLECTION_KEY = nil
    DEFAULT_LIBRARY_TYPE   = nil
    DEFAULT_LIBRARY_ID     = nil
    DEFAULT_LIBRARY_SLUG   = nil

    DEFAULT_API_KEY       = nil
    DEFAULT_FORMAT        = :keys

    attr_accessor *VALID_CONFIG_KEYS

    def self.extended(base)
      base.reset
    end

    def reset
      self.collection_key = DEFAULT_COLLECTION_KEY
      self.library_type   = DEFAULT_LIBRARY_TYPE
      self.library_id     = DEFAULT_LIBRARY_ID
      self.endpoint       = DEFAULT_ENDPOINT
      self.method         = DEFAULT_METHOD
      self.user_agent     = DEFAULT_USER_AGENT
      self.api_key        = DEFAULT_API_KEY
      self.format         = DEFAULT_FORMAT
    end

  end # Configuration
end

# Zotero

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'zotero'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zotero

## Usage

### Configuration

```ruby
Zotero.configure do |config|
  config.api_key        = YOUR_API_KEY
  config.library_id     = YOUR_LIBRARY_ID
  config.library_type   = YOUR_LIBRARY_TYPE
  config.collection_key = COLLECTION_KEY
  config.library_slug   = YOUR_LIBRARY_SLUG
end

```

### Clients

```ruby
client = Zotero::Client.new
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

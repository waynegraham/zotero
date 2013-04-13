require 'spec_helper'

describe Zotero::Configuration do

  after(:all) do
    Zotero.reset
  end

  Zotero::Configuration::VALID_CONFIG_KEYS.each do |key|
    it "should set the #{key}" do
      Zotero.configure do |config|
        config.send("#{key}=", key)
        expect(Zotero.send(key)).to equal key
      end
    end
  end

end

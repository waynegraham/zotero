require 'spec_helper'

 after do
    Zotero.reset
  end


describe 'configuration' do

  Zotero::Configuration::VALID_CONFIG_KEYS.each do |key|
    it "should set the #{key}" do
      Zotero.configure do |config|
        config.send("#{key}=", key)
        Zotero.send(key).should be key
      end
    end
  end
 
  describe 'api_key' do
    it 'should return a default key' do
      Zotero::api_key.should be Zotero::Configuration::DEFAULT_API_KEY
    end
  end

  describe 'collection_key' do
    it 'should return the default collection key' do
      Zotero::collection_key.should be Zotero::Configuration::DEFAULT_COLLECTION_KEY
    end 
  end

  describe 'library_type' do
    it 'should return the default library_type' do
      Zotero::library_type.should be Zotero::Configuration::DEFAULT_LIBRARY_TYPE
    end
  end

  describe 'library_id' do
    it 'should return the default library_id' do
      Zotero::library_id.should be Zotero::Configuration::DEFAULT_LIBRARY_ID
    end
  end

  describe 'library_slug' do
    it 'should return the default library_slug' do
      Zotero::library_slug.should be Zotero::Configuration::DEFAULT_LIBRARY_SLUG
    end
  end

  describe 'user_agent' do
    it 'should return the default user agent' do
      Zotero::user_agent.should be Zotero::Configuration::DEFAULT_USER_AGENT
    end
  end
end

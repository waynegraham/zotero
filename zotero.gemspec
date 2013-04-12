# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zotero/version'

Gem::Specification.new do |spec|
  spec.name          = "zotero"
  spec.version       = Zotero::VERSION
  spec.authors       = ["Wayne Graham"]
  spec.email         = ["wayne.graham@virginia.edu"]
  spec.description   = %q{A Ruby wrapper for the Zotero API}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/waynegraham/zotero"
  spec.license       = "Apache 2"

  spec.signing_key = File.expand_path("~/.gem/private_key.pem") if $0 =~ /gem\z/

  post_install_message =<<eos
********************************************************************************

  You should follow @wayne_graham on Twitter for announcement and updates about
  the gem. https://twitter.com/wayne_graham

  Please direct any issues to the issue tracker on Github 
  https://github.com/waynegraham/zotero/issues

********************************************************************************
eos

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'faraday', ['~> 0.8', '< 0.10']
end

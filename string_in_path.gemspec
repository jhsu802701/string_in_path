# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_in_path/version'

Gem::Specification.new do |spec|
  spec.name          = "string_in_path"
  spec.version       = StringInPath::VERSION
  spec.authors       = ["Jason Hsu"]
  spec.email         = ["Rubyist"]
  spec.summary       = %q{Find out if a substring is present in any files within a directory.  You can even replace it with another substring.}
  spec.description   = %q{Find out if a substring is present in any files within a directory.  You can even replace it with another substring.}
  spec.homepage      = "https://github.com/jhsu802701/string_in_path"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "string_in_file"
end

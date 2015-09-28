# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scratchpaper/version'

Gem::Specification.new do |spec|
  spec.name          = "scratchpaper"
  spec.version       = ScratchPaper::VERSION
  spec.authors       = ["Gregory Brown"]
  spec.email         = ["gregory.t.brown@gmail.com"]
  spec.summary       = "Scratch paper"
  spec.description   = "Scratch paper"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency "rest_client"
end

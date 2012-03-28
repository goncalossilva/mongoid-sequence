# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mongoid-sequence/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gonçalo Silva"]
  gem.email         = ["goncalossilva@gmail.com"]
  gem.description   = %q{Mongoid::Sequence gives you the ability to specify fields to behave like a sequence number (exactly like the "id" column in conventional SQL flavors).}
  gem.summary       = %q{Specify fields to behave like a sequence number (exactly like the "id" column in conventional SQL flavors).}
  gem.homepage      = "https://github.com/goncalossilva/mongoid-sequence"

  gem.add_dependency("mongoid", "~> 2.0")
  gem.add_dependency("activesupport", "~> 3.1")
  gem.add_development_dependency("rake", "~> 0.9")

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "mongoid-sequence"
  gem.require_paths = ["lib"]
  gem.version       = Mongoid::Sequence::VERSION
end

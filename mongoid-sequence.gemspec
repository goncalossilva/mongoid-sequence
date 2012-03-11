# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'mongoid/sequence/version'

Gem::Specification.new do |s|
  s.name          = "mongoid-sequence"
  s.version       = Mongoid::Sequence::VERSION
  s.authors       = ["Gonçalo Silva"]
  s.email         = ["goncalossilva@gmail.com"]
  s.homepage      = "https://github.com/goncalossilva/mongoid-sequence"
  s.summary       = 'Specify fields to behave like a sequence number (exactly like the "id" column in conventional SQL flavors).'
  s.description   = 'Mongoid::Sequence gives you the ability to specify fields to behave like a sequence number (exactly like the "id" column in conventional SQL flavors).'

  s.add_dependency("mongoid", "~> 2.0")
  s.add_dependency("activesupport", "~> 3.1")
  s.add_development_dependency("rake", "~> 0.9")

  s.files         = `git ls-files app lib`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.rubyforge_project = '[none]'
end

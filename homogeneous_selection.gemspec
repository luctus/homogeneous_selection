
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "homogeneous_selection/version"

Gem::Specification.new do |spec|
  spec.name          = "homogeneous_selection"
  spec.version       = HomogeneousSelection::VERSION
  spec.authors       = ["mlabarca"]
  spec.email         = ["mauriciolabarca4tw@gmail.com"]

  spec.summary       = %q{ A small ruby gem exercise. Adds a Class that operates on a hash to produce an array from the nested values of that hash }
  spec.description   = %q{Given a hash with any amount of strings as keys and arrays as values, and a 'x' required amount of items to select, returns an array with a homogeneous selection of x items, mapped by an unique key }
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'ruby_deep_clone'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

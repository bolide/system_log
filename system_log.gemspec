# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'system_log/version'

Gem::Specification.new do |spec|
  spec.name          = "system_log"
  spec.version       = SystemLog::VERSION
  spec.authors       = ["huolg"]
  spec.email         = ["1244002@qq.com"]
  spec.description   = %q{system log show in view}
  spec.summary       = %q{system log show in view}
  spec.homepage      = "http://www.huolg.com/gems/system_log"
  spec.license       = "MIT"
  
  spec.files         = `git ls-files`.split("\n")
  #  spec.files         = [
  #    ".gitignore",
  #    "Gemfile",
  #    "LICENSE.txt",
  #    "README.md",
  #    "Rakefile",
  #    "app/controllers/system_log_controller.rb",
  #    "app/views/layouts/system_log.rhtml",
  #    "app/views/system_log/index.rhtml",
  #    "config/routes.rb",
  #    "lib/system_log.rb",
  #    "lib/system_log/version.rb",
  #    "system_log.gemspec",
  #    "test/system_log_test.rb"
  #  ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "kaminari", "~> 0.14.1"
end

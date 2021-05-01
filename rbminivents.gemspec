require File.expand_path('lib/rbminivents/version', __dir__)

Gem::Specification.new do |spec|
  spec.name                  = 'rbminivents'
  spec.version               = RbMinivents::VERSION
  spec.authors               = ['Max Barsukov']
  spec.email                 = ['maximb2208@gmail.com']
  spec.summary               = 'Tiny eventing gem'
  spec.description           = 'This gem allows you to create and emit your events very easily and minimalistic.'
  spec.homepage              = 'https://github.com/maxbarsukov/rbminivents'
  spec.license               = 'MIT'
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.5.0'

  spec.files = Dir['README.md', 'LICENSE',
                   'CHANGELOG.md', 'lib/**/*.rb',
                   'lib/**/*.rake',
                   'rbminivents.gemspec', '.github/*.md',
                   'Gemfile', 'Rakefile']

  spec.test_files       = Dir['spec/**/*.rb']
  spec.extra_rdoc_files = ['README.md']
  spec.require_paths    = ['lib']

  spec.add_development_dependency 'rubocop', '~> 1.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.5'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.3.0'
end

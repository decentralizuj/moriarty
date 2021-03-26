# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'moriarty'
  s.version     = '0.1.0'
  s.summary     = 'Moriarty - Check social networks for available username.'
  s.description = <<~DESC
    Check social networks for username, and find out is it taken.
    Option to run in 'hunt' mode, to confirm registered users across the networks.
    Easy to use and to extend.
  DESC
  s.authors = ['decentralizuj']
  s.homepage = 'https://github.com/decentralizuj/moriarti'
  s.license = 'MIT'

  s.metadata['homepage_uri'] = 'https://github.com/decentralizuj/moriarti'
  s.metadata['source_code_uri'] = 'https://github.com/decentralizuj/moriarti'
  s.metadata['bug_tracker_uri'] = 'https://github.com/decentralizuj/moriarti/issues'

  s.files = ['bin/moriarty', 'lib/moriarty.rb', 'lib/moriarty/cli.rb', 'moriarti.gemspec',
             'README.md', 'LICENSE']
  s.bindir = 'bin'
  s.executables = ['moriarty']
  s.require_paths = ['lib']

  s.add_runtime_dependency 'colorize', '~> 0.8.1'
  s.add_runtime_dependency 'rest-client', '~> 2.1.0'
  s.add_runtime_dependency 'nokogiri', '~> 1.11.2'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
end

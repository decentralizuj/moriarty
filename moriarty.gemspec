# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'moriarty'
  s.version     = '0.2.1'
  s.summary     = 'Moriarty - Check social networks for available username.'
  s.description = <<~DESC
    Check social networks for username, and find out is it taken.
    Option to run in 'hunt' mode, to confirm registered users across the networks.
  DESC
  s.authors = ['decentralizuj']
  s.homepage = 'https://github.com/decentralizuj/moriarty'
  s.license = 'MIT'

  s.metadata['homepage_uri'] = 'https://github.com/decentralizuj/moriarty'
  s.metadata['source_code_uri'] = 'https://github.com/decentralizuj/moriarty'
  s.metadata['bug_tracker_uri'] = 'https://github.com/decentralizuj/moriarty/issues'

  s.files = ['bin/moriarty', 'lib/moriarty.rb', 'lib/moriarty/cli.rb', 'moriarty.gemspec',
             'README.md', 'LICENSE']
  s.bindir = 'bin'
  s.executables = ['moriarty']
  s.require_paths = ['lib']

  s.add_runtime_dependency 'colorize', '~> 0.8.1'
  s.add_runtime_dependency 'rest-client', '~> 2.1.0'
  s.add_runtime_dependency 'nokogiri', '~> 1.11.2'

  s.add_development_dependency 'bundler', '~> 2.2.9'
  s.add_development_dependency 'rake', '~> 13.0.3'
end

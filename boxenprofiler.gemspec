Gem::Specification.new do |s|
  s.name        = 'boxenprofiler'
  s.version     = '0.0.1'
  s.date        = Time.now.strftime('%Y-%m-%d')

  s.summary     = 'Profiler for boxen'
  s.description = "Profiler for boxen"
  s.authors     = ['Les Aker']
  s.email       = 'me@lesaker.org'
  s.homepage    = 'https://github.com/akerl/boxenprofiler'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split
  s.test_files  = `git ls-files spec/*`.split
  s.executables = ['boxenprofiler']

  s.add_development_dependency 'rubocop', '~> 0.42.0'
  s.add_development_dependency 'rake', '~> 11.2.0'
  s.add_development_dependency 'codecov', '~> 0.1.1'
  s.add_development_dependency 'rspec', '~> 3.5.0'
  s.add_development_dependency 'fuubar', '~> 2.2.0'
end

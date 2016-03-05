#Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## [Unreleased]

## [0.1.0] - 2015-11-19
### Added
- check timeouts: new script to raise an alert when a job has been running for too much time

### Changed
- Update to rubocop 0.32.1
- metrics-resque.rb: format queue name to be graphite friendly

## [0.0.4] - 2015-07-14
### Changed
- updated sensu-plugin gem to 1.2.0

## [0.0.3] - 2015-07-10
### Added
- enabled to specify db number for the redis connection with `-d` option

### Fixed
- fix binstub to only be created for ruby binaries

### Changed
- update documentation links in CONTRIBUTING and README
- set deps to alpha order in Rakefile
- clean unused tasks from Rakefile
- set deps to alphs order in gemspec

## [0.0.2] - 2015-06-03
### Fixed
- added binstubs

### Changed
- removed cruft from /lib

## 0.0.1 - 2015-05-21
### Added
- initial release

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-resque/compare/0.1.0...HEAD
[0.1.0]: https://github.com/sensu-plugins/sensu-plugins-resque/compare/0.0.4...0.1.0
[0.0.4]: https://github.com/sensu-plugins/sensu-plugins-resque/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-resque/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-resque/compare/0.0.1...0.0.2

## Sensu-Plugins-resque

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-resque.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-resque)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-resque.svg)](http://badge.fury.io/rb/sensu-plugins-resque)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-resque/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-resque)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-resque/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-resque)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-resque.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-resque)
[ ![Codeship Status for sensu-plugins/sensu-plugins-resque](https://codeship.com/projects/6bb62090-dbf3-0132-6ddb-025863fcc952/status?branch=master)](https://codeship.com/projects/79839)

## Functionality

## Files
 * bin/metrics-resque

## Usage

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-resque -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-resque`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-resque' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-resque' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes

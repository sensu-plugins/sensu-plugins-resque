#! /usr/bin/env ruby
#
#   resque-timeouts
#
# DESCRIPTION:
#   Monitor Resque queues for jobs that are taking too long
#
# OUTPUT:
#   List of jobs that are taking too long
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   gem: socket
#   gem: resque
#
# USAGE:
#   #YELLOW
#
# NOTES:
#
# LICENSE:
#   Copyright 2015 Mark Wallsgrove <mw@talis.com>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'sensu-plugin/check/cli'
require 'socket'
require 'resque'
require 'resque/failure/redis'
require 'date'

class ResqueTimeouts < Sensu::Plugin::Check::CLI
  option :hostname,
         short: '-h HOSTNAME',
         long: '--host HOSTNAME',
         description: 'Redis hostname',
         required: true

  option :port,
         short: '-P PORT',
         long: '--port PORT',
         description: 'Redis port',
         default: '6379'

  option :db,
         short: '-d DB',
         long: '--db DB',
         description: 'Redis DB',
         default: '0'

  option :namespace,
         description: 'Resque namespace',
         short: '-n NAMESPACE',
         long: '--namespace NAMESPACE',
         default: 'resque'

  option :queue,
         description: 'Name of queue to check',
         short: '-q QUEUE',
         long: '--queue QUEUE',
         required: true

  option :max_lifetime,
         description: 'Maximum amount of time a job should consume',
         short: '-t TIME_SECS',
         long: '--time TIME_SECS',
         required: true

  def run
    redis = Redis.new(
      host: config[:hostname],
      port: config[:port],
      db:   config[:db]
    )

    Resque.redis = redis
    Resque.redis.namespace = config[:namespace]

    max_lifetime = config[:max_lifetime].to_i > 0 ? config[:max_lifetime].to_i : 100
    queue_name = config[:queue]

    workers = Resque.working
    jobs = workers.collect(&:job)
    worker_jobs = workers.zip(jobs)

    job_timeout = false

    worker_jobs.each do |worker, job|
      next unless queue_name == job['queue']
      host, pid = worker.to_s.split(':')
      diff_secs = (Time.now - Time.parse(job['run_at'])).round

      next if diff_secs <= max_lifetime
      output "#{host} (pid: #{pid}) is taking too much time at #{diff_secs} "\
        "seconds (max: #{max_lifetime}) on class #{job['payload']['class']}"
      job_timeout = true
    end

    if job_timeout
      critical
    else
      ok
    end
  end
end

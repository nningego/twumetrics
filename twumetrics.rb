require 'date'
require 'choice'
require './lib/MetricCmd'
require './lib/Daterator'

Choice.options do
  header ''

  option :path, required: true do
    short '-p'
    long '--path=PATH'
    desc 'path to svn repository. Required!'
  end

  option :start_date do
    short '-s'
    long '--start=START_DATE'
    desc 'start date, i.e. 2013-06-01'
    default nil
  end

  option :end_date do
    short '-e'
    long '--end=END_DATE'
    desc 'start date, i.e. 2013-06-15'
    default nil
  end

  option :help do
    long '--help'
    desc 'Show this message'
  end

end

def exec(cmd)
  `#{cmd}`.strip!
end

Daterator.new(Choice[:start_date], Choice[:end_date]).execute do |date|
  exec(MetricCmd.revertTo Choice[:path], date + 1)
  puts "#{date} loc      " + exec(MetricCmd.countLOC Choice[:path])
  puts "#{date} checkins " + exec(MetricCmd.numberOfCheckins Choice[:path], date)
end



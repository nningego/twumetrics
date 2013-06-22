require 'date'
require 'choice'
Dir["./lib/*.rb"].each {|file | require file }

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

twu_metrics = TWUMetrics.new
twu_metrics.report Choice[:path], Choice[:start_date], Choice[:end_date]

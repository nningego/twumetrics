require 'date'
require './lib/MetricCmd'

path = "/Users/mfait/thoughtworks/twu31/trunk"
start_date = "2013-06-12"
end_date = "2013-06-22"

def exec(cmd)
  `#{cmd}`.strip!
end

Date.parse(start_date).upto(Date.parse(end_date)) do |date|
  puts "#{date}: " + exec(MetricCmd.numberOfCheckins path, date)
end



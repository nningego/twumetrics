require './lib/MetricCmd'

path = "/Users/mfait/thoughtworks/twu31/trunk"

def exec(cmd)
  `#{cmd}`.strip!
end

puts exec(MetricCmd.numberOfCheckins path, "2013-06-20")

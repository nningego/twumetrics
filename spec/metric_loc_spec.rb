require 'rspec'
require 'metric_loc'

describe 'lines of code' do

  let(:loc) { MetricLOC.new }

  it { loc.cmd("/some/path", "ANY_DATE").should eq("find /some/path -name '*.java' | xargs wc -l | tail -1 | awk '{print $1}'") }
  it { loc.header.should eq("loc") }

end
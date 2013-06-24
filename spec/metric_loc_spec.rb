require 'rspec'
require 'metric_loc'

describe 'lines of code' do

  it "should build counting command for a subdir" do
    cnt = MetricLOC.new "ANY_HEADER", "sub/path"
    cnt.cmd("/some/path", "ANY_DATE").should eq("find /some/path/sub/path -name '*.java' | xargs wc -l | tail -1 | awk '{print $1}'")
  end

  it "have the right header" do
    tests = MetricLOC.new("LOC test", "any/path")
    tests.header.should eq("LOC test")
  end


end
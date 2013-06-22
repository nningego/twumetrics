require "rspec"
require "MetricCmd"

describe 'MetricCmd' do

  it "should build command for number of checkins" do
    MetricCmd.numberOfCheckins("/some/path", "2013-06-20").should eq("svn log --quiet /some/path | grep 2013-06-20 | wc -l")
  end

  it "should build command for reverting to a certain date" do
    MetricCmd.revertTo("/some/path", "2013-06-20").should eq("svn update /some/path -r {2013-06-20}")
    end

  it "should build command for ounting lines of code" do
    MetricCmd.countLOC("/some/path").should eq("find /some/path -name '*.java' | xargs wc -l | tail -1 | awk '{print $1}'")
  end





end
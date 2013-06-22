require "rspec"
require "MetricCmd"

describe 'MetricCmd' do

  it "should build command for number of checkins" do
    MetricCmd.numberOfCheckins("/some/path", "2013-06-20").should eq("svn log --quiet /some/path | grep 2013-06-20 | wc -l")
  end

end
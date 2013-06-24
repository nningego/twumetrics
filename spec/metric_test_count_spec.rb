require 'rspec'
require 'metric_test_cnt'

describe 'number of tests' do

  it "should build the command for the correct sub di" do
    tests = MetricTestCnt.new("ANY_TITLE", "unit/test/path")
    tests.cmd("/root/path", "ANY_DATE").should eq("grep -r --exclude=\"*\.svn*\" @Test /root/path/src/test/java/unit/test/path/* | wc -l")
  end

  it "should build the command for the correct sub di" do
    tests = MetricTestCnt.new("Unit Tests", "any/path")
    tests.header.should eq("Unit Tests")
  end



end
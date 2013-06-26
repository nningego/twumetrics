require 'rspec'
require 'metric_tag_cnt'

describe 'number of tests' do

  it "should build the command for the correct sub di" do
    tests = MetricTagCnt.new("ANY_TITLE", "unit/test/path", "@Test")
    tests.cmd("/root/path", "ANY_DATE").should eq("grep -r --exclude=\"*\.svn*\" @Test /root/path/src/test/java/unit/test/path/* | wc -l")
  end

  it "have the right header" do
    tests = MetricTagCnt.new("Unit Tests", "any/path", "anyTag")
    tests.header.should eq("Unit Tests")
  end

  it "should look for different tags" do
    MetricTagCnt.new("ANY_TITLE", "unit/test/path", "@Ignore").cmd("/any/path", "ANY_DATE").should include("@Ignore")
  end

end
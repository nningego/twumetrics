require 'rspec'
require 'metric_build_time'

describe 'checkins' do

  let(:checkins) { MetricCheckins.new }

  it { checkins.cmd("/some/path", "2013-06-20").should eq("cd /some/path; svn log --quiet /some/path | grep 2013-06-20 | wc -l") }
  it { checkins.header.should eq("checkins") }

end

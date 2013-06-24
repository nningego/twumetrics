require 'rspec'
require 'metric_unit_tests'

describe 'number of unit tests' do

  let(:loc) { MetricUnitTests.new }

  it { loc.cmd("/some/path", "ANY_DATE").should eq("grep -r --exclude=\"*\.svn*\" @Test /some/path/src/test/java/com/* | wc -l") }
  it { loc.header.should eq("unit") }

end
require 'rspec'
require 'daterator'

describe 'Daterator' do

  it 'should parse start and end from string' do
    daterator = Daterator.new("2013-06-01", "2013-06-10")
    daterator.start.should eq(Date.new(2013,6,1))
    daterator.end.should eq(Date.new(2013,6,10))
  end

  it 'should throw an error when passing in a bad date string' do
    expect { Daterator.new("XXXXXXX", "2013-06-10") }.to raise_error(/bad start date/)
    expect { Daterator.new("2013-06-01", "XXXXXXX") }.to raise_error(/bad end date/)
  end

end
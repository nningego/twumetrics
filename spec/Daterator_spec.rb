require 'rspec'
require 'daterator'

describe 'Daterator' do

  it 'should parse start and end from string' do
    daterator("2013-06-01", "2013-06-10").start.should eq(Date.new(2013,6,1))
    daterator("2013-06-01", "2013-06-10").end.should eq(Date.new(2013,6,10))
  end

  it 'should throw an error when passing in a bad date string' do
    expect { daterator("XXXXXXX", "2013-06-10") }.to raise_error(/bad start date/)
    expect { daterator("2013-06-01", "XXXXXXX") }.to raise_error(/bad end date/)
  end

  it 'should set dates to today if not given' do
    daterator(nil, nil).start.should eq(Date.today)
    daterator(nil, nil).end.should eq(Date.today)
  end

  it 'should set end to start if start is after end' do
    daterator("2013-06-15", "2013-06-01").end.should eq(Date.new(2013,6,15))
  end

  it 'should iterate over dates' do
    expect { |b|
      daterator("2013-06-01", "2013-06-03").execute(&b)
    }.to yield_successive_args(Date.new(2013,6,1), Date.new(2013,6,2), Date.new(2013,6,3))
  end

end

def daterator(start_str, end_str)
  Daterator.new(start_str, end_str)
end


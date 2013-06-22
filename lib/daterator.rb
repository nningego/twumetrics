require 'date'

class Daterator

  attr_reader :start, :end

  def initialize start_str, end_str
    @start = Date.parse(start_str || Date.today.to_s) rescue raise("bad start date '#{start_str}'")
    @end = Date.parse(end_str || Date.today.to_s) rescue raise("bad end date '#{end_str}'")

    @end = @start if @start > @end
  end

  def execute
    @start.upto(@end) { |d| yield d }
  end

end
require 'date'

class Daterator

  attr_reader :start, :end

  def initialize start_str, end_str
    @start = Date.parse(start_str) rescue raise("bad start date")
    @end = Date.parse(end_str) rescue raise("bad end date")
  end

end
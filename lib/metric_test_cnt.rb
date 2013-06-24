class MetricTestCnt

  attr_reader :header

  def initialize header, test_path
    @header = header
    @test_path = test_path
  end

  def cmd path, date
    "grep -r --exclude=\"*\.svn*\" @Test #{path}/src/test/java/#{@test_path}/* | wc -l"
  end

end
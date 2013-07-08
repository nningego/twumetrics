class MetricTagCnt

  attr_reader :header, :tag

  def initialize header, test_path, tag
    @header = header
    @test_path = test_path
    @tag = tag
  end

  def cmd path, date
    "grep -r -i --exclude=\"*\.svn*\" #{@tag} #{path}/src/test/java/#{@test_path}/* | wc -l"
  end

end

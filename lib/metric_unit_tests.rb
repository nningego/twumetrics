class MetricUnitTests

  def header
    "unit"
  end

  def cmd path, date
    "grep -r --exclude=\"*\.svn*\" @Test #{path}/src/test/java/com/* | wc -l"
  end

end
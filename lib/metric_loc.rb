class MetricLOC

  def header
    "loc"
  end

  def cmd path, date
    "find #{path} -name '*.java' | xargs wc -l | tail -1 | awk '{print $1}'"
  end

end
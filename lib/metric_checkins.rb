class MetricCheckins

  def header
    "checkins"
  end

  def cmd path, date
    "svn log --quiet #{path} | grep #{date} | wc -l"
  end

end
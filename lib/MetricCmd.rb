module MetricCmd

  def self.numberOfCheckins path, date
    "svn log --quiet #{path} | grep #{date} | wc -l"
  end

end
module MetricCmd

  def self.numberOfCheckins path, date
    "svn log --quiet #{path} | grep #{date} | wc -l"
  end

  def self.revertTo path, date
    "svn update #{path} -r {#{date}}"
  end

  def self.countLOC path
    "find #{path} -name '*.java' | xargs wc -l | tail -1 | awk '{print $1}'"
  end

end
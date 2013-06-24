class TWUMetrics

  def report path, start_date, end_date
    metrics = [
        MetricCheckins.new,
        MetricLOC.new("LOC_prod", "src/main"),
        MetricLOC.new("LOC_test", "src/test"),
        MetricTestCnt.new("unit", "com"),
        MetricTestCnt.new("integration", "integration"),
        MetricTestCnt.new("functional", "functional"),
    ]

    puts header(metrics)

    Daterator.new(start_date, end_date).execute do |date|
      revertTo(date, path)
      puts data(date, path, metrics)
    end
  end

  private

  def exec(cmd)
    `#{cmd}`.strip!
  end

  def revertTo(date, path)
    exec(SvnHelper.revertTo path, date + 1)
  end

  def header(metrics)
    (["date"] + metrics.map { |metric| metric.header }).join("\t")
  end

  def data(date, path, metrics)
    ([date] + metrics.map { |metric| exec(metric.cmd(path, date)) }).join("\t")
  end

end
# Cucumber task helper
module CucumberHelper
  def setup_task(task)
    task.binary = vendored_cucumber_bin
    task.fork = true
  end
end

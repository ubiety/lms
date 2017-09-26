# Cucumber task helper
module CucumberHelper
  def self.setup_task(task, bin)
    task.binary = bin
    task.fork = true
  end
end

class ExampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Just prints the current time to a tempfile.
    # Useful for confirming Jobs are working
    File.write("/tmp/#{self.class.name}_last_run", DateTime.now.to_s)
  end
end

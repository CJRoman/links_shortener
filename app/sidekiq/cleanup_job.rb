class CleanupJob
  include Sidekiq::Job

  def perform(*args)
    Links::CleanupService.new.call
  end
end

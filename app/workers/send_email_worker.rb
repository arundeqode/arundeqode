class SendEmailWorker
  include Sidekiq::Worker

  # sidekiq_options queue: 'batches'
  def perform
    batch = Sidekiq::Batch.new
    batch.description = "Batch description (this is optional)"
    batch.jobs do
      UserEmailWorker.perform_async
    end
  end
end


class SendEmailWorker
  include Sidekiq::Worker

  def perform
    User.all.each do |user|
      UserMailer.with(user: user).new_product_email.deliver_later
    end
  end
end

class Product < ApplicationRecord
  has_many :images, as: :imageable

  accepts_nested_attributes_for :images,  allow_destroy: true
  after_create :send_email

  private

  def send_email
    SendEmailWorker.perform_async
  end
end

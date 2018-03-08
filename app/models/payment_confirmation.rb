class PaymentConfirmation < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :payment_method,
             :counter_cache => true

  belongs_to :group,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :group_id, :presence => true

  validates :image, :presence => true

  validates :payment_method_id, :presence => true

end

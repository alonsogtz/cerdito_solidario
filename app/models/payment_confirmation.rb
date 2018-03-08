class PaymentConfirmation < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :group_id, :presence => true

  validates :image, :presence => true

  validates :payment_method_id, :presence => true

end

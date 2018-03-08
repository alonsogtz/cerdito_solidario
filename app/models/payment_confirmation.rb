class PaymentConfirmation < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :payment_method_id, :presence => true

end

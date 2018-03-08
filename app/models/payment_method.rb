class PaymentMethod < ApplicationRecord
  # Direct associations

  has_many   :payment_confirmations

  # Indirect associations

  # Validations

  validates :account_number, :presence => true

  validates :bank_id, :presence => true

end

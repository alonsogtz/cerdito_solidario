class PaymentMethod < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :account_number, :presence => true

  validates :bank_id, :presence => true

end

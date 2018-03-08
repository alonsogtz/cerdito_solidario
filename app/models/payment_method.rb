class PaymentMethod < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :bank_id, :presence => true

end

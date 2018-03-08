class Bank < ApplicationRecord
  # Direct associations

  has_many   :disbursement_options

  has_many   :payment_methods

  # Indirect associations

  # Validations

  validates :name, :presence => true

end

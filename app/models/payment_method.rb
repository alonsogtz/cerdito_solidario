class PaymentMethod < ApplicationRecord
  # Direct associations

  belongs_to :bank,
             :counter_cache => true

  has_many   :groups,
             :foreign_key => "preferredp_mt_method_id"

  has_many   :payment_confirmations

  # Indirect associations

  # Validations

  validates :account_number, :presence => true

  validates :bank_id, :presence => true

end

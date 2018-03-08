class DisbursementOption < ApplicationRecord
  # Direct associations

  has_many   :credits,
             :dependent => :nullify

  belongs_to :bank,
             :counter_cache => true

  belongs_to :beneficiary,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

class DisbursementOption < ApplicationRecord
  # Direct associations

  belongs_to :beneficiary,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

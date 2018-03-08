class Group < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :presence => true

  validates :preferredp_mt_method_id, :presence => true

end

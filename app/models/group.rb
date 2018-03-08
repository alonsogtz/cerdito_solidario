class Group < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :community_id, :presence => true

  validates :end_date, :presence => true

  validates :name, :presence => true

  validates :preferredp_mt_method_id, :presence => true

end

class Leader < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :group_id, :presence => true

  validates :user_id, :presence => true

end

class Credit < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :status, :presence => true

  validates :user_id, :presence => true

end

class AdditionalInfo < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :description, :presence => true

  validates :title, :presence => true

  validates :user_id, :presence => true

end

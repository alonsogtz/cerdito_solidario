class PersonalMessage < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :receiver_id, :presence => true

  validates :sender_id, :presence => true

end

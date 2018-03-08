class PersonalMessage < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :message, :presence => true

  validates :receiver_id, :presence => true

  validates :sender_id, :presence => true

end

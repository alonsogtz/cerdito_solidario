class PersonalMessage < ApplicationRecord
  # Direct associations

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => :sent_messages_count

  # Indirect associations

  # Validations

  validates :message, :presence => true

  validates :receiver_id, :presence => true

  validates :sender_id, :presence => true

end

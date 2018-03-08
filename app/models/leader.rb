class Leader < ApplicationRecord
  # Direct associations

  belongs_to :group,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :group_id, :presence => true

  validates :user_id, :presence => true

end

class Credit < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :amount, :presence => true

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }

  validates :group_id, :presence => true

  validates :status, :presence => true

  validates :user_id, :presence => true

end

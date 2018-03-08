class Group < ApplicationRecord
  # Direct associations

  belongs_to :preferredp_mt_method,
             :class_name => "PaymentMethod",
             :counter_cache => true

  has_many   :leaders

  has_many   :group_comments

  has_many   :payment_confirmations

  has_many   :credits,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :begining_date, :presence => true

  validates :community_id, :presence => true

  validates :end_date, :presence => true

  validates :name, :presence => true

  validates :preferredp_mt_method_id, :presence => true

end

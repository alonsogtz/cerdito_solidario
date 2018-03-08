class Community < ApplicationRecord
  # Direct associations

  belongs_to :state,
             :counter_cache => :areas_count

  has_many   :groups

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:state_id] }

  validates :name, :presence => true

end

class Community < ApplicationRecord
  # Direct associations

  has_many   :groups

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:state_id] }

  validates :name, :presence => true

end

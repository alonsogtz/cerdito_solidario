class Community < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:state_id] }

  validates :name, :presence => true

end

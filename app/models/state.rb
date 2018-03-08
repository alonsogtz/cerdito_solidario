class State < ApplicationRecord
  # Direct associations

  has_many   :areas,
             :class_name => "Community",
             :dependent => :destroy

  # Indirect associations

  # Validations

end

class User < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :maternal_last_name, :presence => true

  validates :paternal_last_name, :presence => true

  validates :phone, :uniqueness => { :allow_blank => true }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

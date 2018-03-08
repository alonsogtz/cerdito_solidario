class User < ApplicationRecord
  # Direct associations

  has_many   :sent_messages,
             :class_name => "PersonalMessage",
             :foreign_key => "sender_id"

  # Indirect associations

  # Validations

  validates :curp, :uniqueness => { :allow_blank => true }

  validates :given_name, :presence => true

  validates :maternal_last_name, :presence => true

  validates :paternal_last_name, :presence => true

  validates :phone, :uniqueness => { :allow_blank => true }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

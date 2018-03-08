class User < ApplicationRecord
  # Direct associations

  has_many   :disbursement_options,
             :foreign_key => "beneficiary_id",
             :dependent => :nullify

  has_many   :additional_infos

  has_many   :leaders

  has_many   :group_comments

  has_many   :credits

  has_many   :received_messages,
             :class_name => "PersonalMessage",
             :foreign_key => "receiver_id"

  has_many   :sent_messages,
             :class_name => "PersonalMessage",
             :foreign_key => "sender_id"

  # Indirect associations

  has_many   :senders,
             :through => :received_messages,
             :source => :sender

  has_many   :recipients,
             :through => :sent_messages,
             :source => :receiver

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

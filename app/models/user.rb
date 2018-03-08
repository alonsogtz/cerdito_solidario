require 'open-uri'
class User < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :proof_of_adress_image, ProofOfAdressImageUploader

  mount_uploader :curp_image, CurpImageUploader

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

  has_many   :leading_groups,
             :through => :leaders,
             :source => :group

  has_many   :commented_groups,
             :through => :group_comments,
             :source => :group

  has_many   :credit_groups,
             :through => :credits,
             :source => :group

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

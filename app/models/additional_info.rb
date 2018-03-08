class AdditionalInfo < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :description, :presence => true

  validates :title, :presence => true

  validates :user_id, :presence => true

end

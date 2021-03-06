class Pin < ApplicationRecord

  validates :title, :description, :image, presence: true
  belongs_to :user
  mount_uploader :image, PhotoUploader
  acts_as_votable

end

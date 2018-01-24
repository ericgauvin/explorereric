class Photo < ActiveRecord::Base
  validates_presence_of :image
  mount_uploader :image, PhotoUploader
end

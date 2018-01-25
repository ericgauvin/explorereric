class Photo < ActiveRecord::Base
  validates_presence_of :image
  mount_uploader :image, PhotoUploader

	def self.search(query_hash)
		result = all
		result = result.where("country like ?", "%#{query_hash[:country]}%") if query_hash[:country]
		result = result.where("year like ?", "%#{query_hash[:year]}%") if query_hash[:year]
		result
	end

	COUNTRIES = Photo.pluck(:country)
	YEARS = Photo.pluck(:year)

end

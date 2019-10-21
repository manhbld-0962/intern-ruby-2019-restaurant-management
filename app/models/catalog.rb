class Catalog < ApplicationRecord
  CATALOG_PARAMS = %i(name description image).freeze

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: {maximum: Settings.models.catalogs.name}, uniqueness: true
  validates :description, length: {maximum: Settings.models.catalogs.description}
  validates :image, file_size: {less_than_or_equal_to: Settings.models.photos.size.megabytes}
end

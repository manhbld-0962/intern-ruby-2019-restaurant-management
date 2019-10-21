class Catalog < ApplicationRecord
  validates :name, presence: true, length: {maximum: Settings.models.catalogs.name}, uniqueness: true
  validates :description, length: {maximum: Settings.models.catalogs.description}
end

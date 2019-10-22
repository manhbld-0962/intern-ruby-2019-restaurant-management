class Post < ApplicationRecord
  belongs_to :catalog
  scope :find_post, -> (id) { where("catalog_id = ?", id)}

  validates :title, presence: true, length: { maximum: 200 }, uniqueness: true
  validates :content, presence: true
end

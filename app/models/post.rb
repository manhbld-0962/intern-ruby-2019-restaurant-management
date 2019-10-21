class Post < ApplicationRecord
  belongs_to :catalog

  validates :title, presence: true, length: { maximum: 200 }, uniqueness: true
  validates :content, presence: true
end

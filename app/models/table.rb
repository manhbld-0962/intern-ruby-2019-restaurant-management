class Table < ApplicationRecord
  enum type: [:single ,:couple, :family, :meeting]
  validates :type, presence: true
  validates :desc, presence: true, length: { maximum: 100 }
end

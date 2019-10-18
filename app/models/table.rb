class Table < ApplicationRecord
  enum type_table: [:single ,:couple, :family, :meeting]
  validates :type_table, presence: true
  validates :desc, presence: true, length: { maximum: 100 }
end

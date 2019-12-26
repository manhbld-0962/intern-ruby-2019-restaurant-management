class Table < ApplicationRecord
  TABLE_PARAMS = %i(description type_table).freeze

  scope :get_table, ->{select(:id, :description, :type_table)}

  validates :type_table, presence: true
  validates :description, presence: true, length: {maximum: Settings.models.tables.description}
  enum type_table: [:single ,:couple, :family, :meeting]
end

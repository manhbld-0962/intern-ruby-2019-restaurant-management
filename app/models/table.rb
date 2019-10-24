class Table < ApplicationRecord
  TABLE_PARAMS = %i(description type_table).freeze
  TABLE_LOAD_PARAMS = %i(id description type_table).freeze

  validates :type_table, presence: true
  validates :description, presence: true, length: {maximum: Settings.models.tables.description}

  enum type_table: [:single ,:couple, :family, :meeting]

  scope :get_table, ->{select(TABLE_LOAD_PARAMS)}
end

class Menu < ApplicationRecord
  MENU_PARAMS_CREATE = %i(date_at).freeze
  MENU_PARAMS_EDIT = %i(date_at food_id).freeze

  belongs_to :food

  validates :date_at, presence: true, date: {after_or_equal_to: Time.current.to_date}
  validates :food_id, presence: true
  validates_uniqueness_of :date_at, scope: :food_id

  scope :find_date, ->(date){where("date_at = ?", date)}

  def get_date
    I18n.t("menus.date", date: self.date_at)
  end
end

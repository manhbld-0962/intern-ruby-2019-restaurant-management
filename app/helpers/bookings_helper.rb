module BookingsHelper
  def list_people select_type
    number = Table.type_tables[select_type]
    Booking.people.keys[0..number]
  end

  def check_unpaid? booking
    booking.unpaid? && (current_user == booking.user || current_user.admin?)
  end
end

class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_up, only: [:show, :update, :destroy, :edit]
  before_action :set_table, only: [:create, :new]
  before_action :check_table_status, only: :create

  def new
    @booking = Booking.new
    @array_people = Booking.people.keys[0..Table.type_tables[@table.type_table]] 
  end

  def show
  end

  def index
    @bookings = Booking.find_book(current_user.id)
  end

  def create
    if check_hour?(params[:booking][:book_at].to_time.hour) && !Booking.check_book_exsits(params[:booking][:book_at]).present?
      @booking = @table.books.new(params_booking)
      @booking.user_id = current_user.id
      if @booking.save
        flash[:success] = "Booking Complete!"
        redirect_to tables_path
      else
        render :new
      end
    else
      @booking = Booking.new
      flash.now[:warning] = "Table was booked at the time!"
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update_attributes(params_booking_update)
      flash[:success] = t(:massage_edit)
      redirect_to show_booking_path
    else
      render :edit
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:people, :book_at, :desc)
  end

  def params_booking_update
    params.require(:booking).permit(:checkout)
  end

  def set_up
    @booking = Booking.find_by(id: params[:id])

    return if @booking
    flash[:warning] = t(:massage_not_exsits)
    redirect_to request.referrer
  end

  def set_table
    @table = Table.find(params[:table_id])

    return if @table
    flash[:warning] = t(:massage_not_exsits)
    redirect_to tables_path
  end

  def check_table_status
    return if @table.free?
    flash[:warning] = "Table isn't free!"
    redirect_to tables_path
  end
end

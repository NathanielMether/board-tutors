class BookingsController < ApplicationController
  before_action :set_profile
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.where("user_id = #{current_user.id}")
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.profile = @profile
    @booking.user = current_user

    # Amount in cents
    @amount = @booking.profile.price * 100 * @booking.lesson_length

    respond_to do |format|
      @booking.update_time_date
      if @booking.save
        customer = Stripe::Customer.create(
          :email => current_user.email,
          :source  => params[:stripeToken]
        )

        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount,
          :description => "Lesson with " + @booking.profile.user.first_name,
          :currency    => 'aud'
        )

        # New conversation between the 2 users so that they can be added to the contacts page
        if Conversation.where(user1_id: current_user.id, user2_id: @booking.profile.user.id).empty?
          Conversation.create(user1_id: current_user.id, user2_id: @booking.profile.user.id)
        end

        @booking.charge_identifier = charge.id
        format.html { redirect_to profile_bookings_url(@profile), notice: 'Booking was successfully created.' }
        format.json { render :index, status: :ok, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end

    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to profile_bookings_url(@profile), notice: 'Booking was successfully updated.' }
        format.json { render :index, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to profile_bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:lesson_date, :start_at, :end_at)
    end
end

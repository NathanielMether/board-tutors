class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.search(params[:term]) & Profile.search(params[:location]) & Profile.search(params[:board])

    @reviews = []
    @profiles.each do |profile|
      @average_rating = Review.where(profile_id: profile).average(:rating)
      @reviews << @average_rating
    end

    # Sort profiles depending on params
    if params[:sort] == 'Rating'
      @profiles.sort_by! do |profile|
        @reviews[profile.id - 1]
      end
      @profiles = @profiles.reverse
    elsif params[:sort] == 'Price(lowest)'
      @profiles.sort_by! do |profile|
        profile[:price]
      end
    elsif params[:sort] == 'Price(highest)'
      @profiles.sort_by! do |profile|
        profile[:price]
      end
      @profiles = @profiles.reverse
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @last_review = Review.where(profile_id: @profile).last
    @average_rating = Review.where(profile_id: @profile).average(:rating)

    # Check if there is an existing conversation between current user and the profile
    @conversation = (Conversation.where(user1_id: @profile.user.id) & Conversation.where(user2_id: current_user.id)) | (Conversation.where(user2_id: @profile.user.id) & Conversation.where(user1_id: current_user.id))

    # If there is no conversation then create a new one
    if @conversation.empty?
      @conversation = Conversation.new
    end

    # Get the all profiles that belong to the user
    @profiles = Profile.where(user: @profile.user)
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
      unless current_user.profiles.find_by(id: @profile.id)
        authorize @profile
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:profile_image, :remove_profile_image, :board_sport, :price, :locations, :bio, :description)
    end
end

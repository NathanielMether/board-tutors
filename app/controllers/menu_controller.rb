class MenuController < ApplicationController
  def index
    @profile = Profile.where(user: current_user).first
  end
end

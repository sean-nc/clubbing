class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]
  before_action :is_users_profile?, only: [:edit, :update, :destroy]

  def new
    @profile = current_user.build_profile
  end

  def edit
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to current_user, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to current_user, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    redirect_to venues_url, notice: 'Venue was successfully destroyed.'
  end

  private
    def set_profile
      @profile = current_user.profile
    end

    def is_users_profile?
      unless @profile == current_user.profile
        redirect_to current_user, notice: 'You do not have access to that page.'
      end
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :gender, :date_of_birth)
    end
end

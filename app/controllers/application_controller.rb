class ApplicationController < ActionController::Base
  before_action :is_logged_in?
  skip_before_action :is_logged_in?, if: :devise_controller?
  before_action :has_profile?
  skip_before_action :has_profile?, if: :devise_controller?

  private
    def is_logged_in?
      unless current_user
        redirect_to new_user_session_path, notice: 'Please sign in.'
      end
    end

    def is_admin?
      unless current_user and current_user.admin
        redirect_to root_path, notice: 'You do not have permission for that page.'
      end
    end

    def is_owner?
      unless current_user and (current_user == @venue.owner or current_user.admin)
        redirect_to @venue, notice: 'You do not have permission for that page.'
      end
    end

    def has_profile?
      unless current_user and current_user.profile
        redirect_to new_user_profile_path(current_user), notice: "Please fill out your profile first."
      end
    end
end

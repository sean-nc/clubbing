class ApplicationController < ActionController::Base
  private
    def is_logged_in?
      unless current_user
        redirect_to new_user_sign_in_path, notice: 'Please sign in.'
      end
    end

    def is_admin?
      unless current_user and current_user.admin
        redirect_to root_path, notice: 'You do not have permission for that page.'
      end
    end

    def is_owner?
      unless current_user and current_user == @venue.owner or current_user.admin
        redirect_to @venue, notice: 'You do not have permission for that page.'
      end
    end
end

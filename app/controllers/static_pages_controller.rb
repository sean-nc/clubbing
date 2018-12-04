class StaticPagesController < ApplicationController
  skip_before_action :is_logged_in?
  skip_before_action :has_profile?

  def home
  end
end

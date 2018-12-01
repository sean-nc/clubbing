class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy, :employees, :add_employee]
  before_action :is_admin?, only: [:new, :create, :destroy]
  before_action :is_owner?, only: [:edit, :update, :employees, :add_employee]

  def index
    @venues = Venue.all
  end

  def show
  end

  def new
    @venue = Venue.new
  end

  def edit
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to @venue, notice: 'Venue was successfully created.'
    else
      render :new
    end
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue, notice: 'Venue was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    redirect_to venues_url, notice: 'Venue was successfully destroyed.'
  end

  def employees
    @users = User.with_role(:employee, @venue)

    if params[:email]
      @user = User.find_by(email: params[:email])
      if @user.has_role?(:employee, @venue)
        return redirect_to employees_venue_path(@venue),
               notice: "#{@user.email} is already employeed."
      end
    end

    if params[:delete_user]
      user = User.find(params[:delete_user])
      user.remove_role(:employee, @venue)
      redirect_to employees_venue_path(@venue), notice: "#{user.email} was removed as an employee."
    end

    if params[:add_user]
      user = User.find(params[:add_user])
      if user.has_role?(:employee, @venue)
        return redirect_to employees_venue_path(@venue),
               notice: "#{user.email} is already employeed."
      end
      user.add_role(:employee, @venue)
      redirect_to employees_venue_path(@venue), notice: "#{user.email} was added as an employee."
    end
  end

  private
    def set_venue
      @venue = Venue.find(params[:id])
    end

    def venue_params
      params.require(:venue).permit(:name, :location, :age, :email, :phone, :capacity,
                                    :music, :dress_code, :website, :category, :owner_id)
    end
end

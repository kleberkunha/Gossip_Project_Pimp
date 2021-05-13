class UsersController < ApplicationController
  def index
  end

  def create
    if City.find_by(name: params[:city])
      @city = City.find_by(name: params[:city])
    else
      @city = City.create(name: params[:city], zip_code: params[:zip_code])
    end

     @user = User.new(first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description],
      email: params[:email],
      age: params[:age],
      city_id: @city.id,
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )

    if @user.save
      flash[:success] = "Welcome #{@user.first_name}! "
      log_in(@user)
      redirect_to index_path
    end
  end
end

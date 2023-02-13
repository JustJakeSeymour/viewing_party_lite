class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    if user_params[:password] == params[:user][:password_confirmation]
      require 'pry'; binding.pry
      user_create
    else
      flash[:alert] = "Password and confirmation must be the same"
      @user = User.new({name: user_params[:name], email: user_params[:email]})
      render :new
    end
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      redirect_to user_path(@user)
    else
      flash[:alert] = "Password invalid"
      @user = User.new({email: params[:email]})
      render :login_form
    end
  end

private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
  def user_create
    user = user_params
    user[:name] = user[:name].downcase
    new_user = User.new(user)
    
    if new_user.save
      flash[:notice] = "User successfully created"
      redirect_to user_path(new_user.id)
    else
      flash[:alert] = "User creation failed"
      @user = User.new(user_params)
      render :new
    end
  end
end
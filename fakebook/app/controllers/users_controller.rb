class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:edit, :update]
  before_action :correct_user,  only: [:edit, :update]
  
  def index
    @users= User.all
    
  end
  def show
    @user= User.find(params[:id])
    @comments = Comment.all
  end
  
  def new
    @user=User.new 
  end
  
  def create
    @user=User.new(user_params)
    
    if @user.save
      log_in(@user)
      #handles a successful submission
      flash[:success]="welcome to fakebook"
      redirect_to user_url(@user)
    else  
    render 'new'
    end 
  end
  
  def edit
    
    # @user= User.find(params[:id])
  end
  
  def update
  # @user= User.find(params[:id])
      if @user.update_attributes(user_params)
         redirect_to @user
      else
        render 'edit'
      end
  
  end
  

  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :work, :education, :about, :relatioship, :dob, :interests, :events)
    end
    
    def logged_in_user
      unless logged_in?
      redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  
  
end

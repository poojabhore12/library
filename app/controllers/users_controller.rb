class UsersController < ApplicationController
    require 'date'
    before_action :set_user, only: [:show, :edit, :update, :destroy] 

    def index
      @users = User.all
    end
  

    def show
    end

    def new
      @user = User.new
    end
  

    def edit
    end
  

    def create
      @user = User.new(user_params)
  
      respond_to do |format|
        if @user.save
          redirect_to @user, notice: 'User was successfully created.' 
          render :show, status: :created, location: @user 
        else
           render :new 
          
        end
      end
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
           redirect_to @user, notice: 'Profile Details Successfully Updated.' 
           render :show, status: :ok, location: @user 
        else
           render :edit 
          
        end
      end
    end

    def destroy
      user_books = Book.find_by(user_id: @user.id)
        if user_books == nil
          @user.destroy
          flash[:notice] = "User was successfully deleted."
          redirect_to users_url
        else
          flash[:danger] = "User has books checked out! Can't delete"
          redirect_to users_url
        end
    end
    

    private
      def set_user
        @user = User.find(params[:id])
      end
  
       def user_params
        params.require(:user).permit(:name, :email, :password, :role)
      end
    end
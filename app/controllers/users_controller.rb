class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]

  def index
      @user = User.find(current_user.id)
      @book = Book.new
      @users = User.all
  end
  def show
  	  @user = User.find(params[:id])
  	  @books = @user.books
  	  @book = Book.new

  end
  def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
           redirect_to book_path(@book), notice: "You have successfully created a book"
        else 
        @books = Book.all
           @user = User.find(current_user.id)
           render "book/index"
        end
  end
  def edit
      @user = User.find(params[:id])
  end
  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to user_path(@user.id), notice: "You have successfully updated user."
      else 
         render "edit"
      end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
    private
  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end
end

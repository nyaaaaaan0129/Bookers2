class UsersController < ApplicationController
  def show
  	  @user = User.find(params[:id])
  	  @books = @user.books
  	  @book = Book.new

  end
  def create
        book = Book.new(book_params)
        book.user_id = current_user.id
        book.save
        redirect_to books_path
  end
  def edit
      @user = User.find(params[:id])
  end
end

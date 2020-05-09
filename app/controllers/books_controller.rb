class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]
    def index
        @user = User.find(current_user.id)
    	@book = Book.new
        @books = Book.all
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
           redirect_to book_path(@book.id), notice: "Book was successfully created."
        else
           @books = Book.all
           @user = User.find(current_user.id)
           render "index"
        end
    end

    def show
        
        @book = Book.new
        @book_show = Book.find(params[:id])
        @user = User.find(@book_show.user_id)
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
           redirect_to book_path(@book.id), notice: "Book was successfully updated."
        else
           render "edit"
        end
    end
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
    def correct_user
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end
end

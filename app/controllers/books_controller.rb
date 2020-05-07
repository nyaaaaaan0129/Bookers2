class BooksController < ApplicationController
    before_action :authenticate_user!
    def index
        @user = User.find(current_user.id)
    	@book = Book.new
        @books = Book.all
    end

    def create
        book = Book.new(book_params)
        book.user_id = current_user.id
        book.save
        redirect_to books_path
    end

    def show
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end

class SearchController < ApplicationController

	def search
		@model = params[:option1]
		@search_method = params[:option2]
		if @model == "1" && @search_method == "1"
		  @users = User.where('name LIKE ?', "%#{params[:search]}%")
		elsif @model == "1" && @search_method == "2"
		  @users = User.where('name LIKE ?', "#{params[:search]}")
		elsif @model == "1" && @search_method == "3"
          @users = User.where('name LIKE ?', "#{params[:search]}%")
        elsif @model == "1" && @search_method == "4"
          @users = User.where('name LIKE ?', "%#{params[:search]}")
        elsif @model == "2" && @search_method == "1"
          @books = Book.where('title LIKE ?', "%#{params[:search]}%")
        	render 'books/search_books'
        elsif @model == "2" && @search_method == "2"
          @books = Book.where('title LIKE ?', "#{params[:search]}")
        	render 'books/search_books'
        elsif @model == "2" && @search_method == "3"
          @books = Book.where('title LIKE ?', "#{params[:search]}%")
        	render 'books/search_books'
        elsif @model == "2" && @search_method == "4"
          @books = Book.where('title LIKE ?', "%#{params[:search]}")
        	render 'books/search_books'
		end
	end
end

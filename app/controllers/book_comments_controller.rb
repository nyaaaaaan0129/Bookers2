class BookCommentsController < ApplicationController

	def create
        @book = Book.new
		@book_show = Book.find(params[:book_id])
		@book_comment = BookComment.new(book_comment_params)
		@book_comment.user_id = current_user.id
		@book_comment.book_id = @book_show.id
		if @book_comment.save
		redirect_to book_path(@book_show), notice: "Book comment was successfully created."
        else
        @user = User.find(@book_show.user_id)
        # @book_comment = BookComment.new
        @book_comments = @book_show.book_comments
        render "books/show"
        end
	end
	def destroy
        # book = Book.find(params[:book_id])
        comment = BookComment.find(params[:book_id])
        comment.destroy if comment.user_id == current_user.id
        # comment = book.book_comments.find(params[:id])
        # comment.destro
        redirect_to book_path(comment.book_id)
        # # ==========================================
        # book = Book.find(params[:book_id])
        # comment = BookComment.find(params[:book_comment_id]) # link_to book_comment_id
        # if (book.id == comment.book_id) && (current_user.id == comment.user_id)
        # 	comment.destroy
        # end

        # redirect_to book_path(book.id)
    end


	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end

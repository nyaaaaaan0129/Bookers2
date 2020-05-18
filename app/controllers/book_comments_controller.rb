class BookCommentsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		comment = BookComment.new(book_comment_params)
		comment.user_id = current_user.id
		comment.book_id = book.id
		comment.save
		redirect_to book_path(book)
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

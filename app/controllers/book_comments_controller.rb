class BookCommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:destroy]

def create
	 book = Book.find(params[:book_id])
	 comment = BookComment.new(book_comment_params)
	 comment.user_id = current_user.id
	 comment.book_id = book.id
	 comment.save
	 redirect_to book_path(book)

end

def destroy
	comment = BookComment.find(params[:id])
	comment.destroy
	redirect_to book_path
end
private
def correct_user
 book = Book.find(params[:id])
	if book.user_id != current_user.id
	  redirect_to books_path
    end
end

def book_comment_params
	params.require(:book_comment).permit(:comment, :user_id, :book_id)
end
end
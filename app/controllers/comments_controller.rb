class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(comments_params)
		if @comment.save
			CommentMailer.comment_notification(@comment, @article).deliver
			flash[:success] = "Thanks for commenting!"
			redirect_to article_path(@article)
		else
			flash[:danger] = "Name and comment fields must be filled in to post a comment."
			redirect_to article_path(@article)
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
		def comments_params
			params.require(:comment).permit(:name, :email, :body)
		end

end

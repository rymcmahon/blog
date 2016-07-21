class CommentsController < ApplicationController
before_action :admin_user, only: [:index, :show, :edit, :destroy]

	def index
		@article = Article.find(params[:article_id])
		@comments = @article.comments
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(comments_params)
		if @comment.save
			CommentMailer.comment_notification(@comment, @article).deliver
			flash[:notice] = "Thanks for commenting! Your comment will appear after it is approved."
			redirect_to article_path(@article)
		else
			flash[:alert] = "You must provide a name, valid email address, and a comment."
			redirect_to article_path(@article)
		end
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comments_params)
			redirect_to article_comments_path
		else
			render 'edit'
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
			params.require(:comment).permit(:name, :email, :body, :subtitle, :approved)
		end

		def admin_user
			unless current_user.try(:admin?)
				flash[:danger] = "You ain't no Admin, fool!"
				redirect_to(root_url)
			end
		end

end

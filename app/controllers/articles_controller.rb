class ArticlesController < ApplicationController

	def index
		@articles = Article.all
		@categories = Category.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
		@categories = Category.all
	end

	def edit
		@article = Article.find(params[:id])
		@categories = Category.all
	end

	def create
		@article = Article.new(article_params)
		@categories = Category.all

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		params[:article][:category_ids] ||= []

		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text, :category_ids => [])
		end
end
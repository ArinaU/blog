class ArticlesController < ApplicationController
	load_and_authorize_resource

	def index
		@articles = Article.all
	end

	def new
	end

	def create
		#@article = Article.new(params.require(:article).permit(:title, :text))
		@article = Article.new(article_params)
		@article.user = User.first
  		@article.save
  		redirect_to @article
  		#render plain: params[:article].inspect
	end

	def show
    	@article = Article.find(params[:id])
    	@user = @article.user
	end

	private

  	def article_params
    	params.require(:article).permit(:title, :text)
  	end

end

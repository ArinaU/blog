class ArticlesController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	load_and_authorize_resource

	def index
		@articles = Article.all
		#@article = Article.find(params[:id])
	end

	def new
		@article = current_user.articles.build
	end

	def create
		#@article = Article.new(article_params)
		@article = current_user.articles.build(article_params)
  		@article.save
  		redirect_to @article
	end

	def show
    	@article = Article.find(params[:id])
    	@user = @article.user
	end

	def destroy
		Article.find(params[:id]).destroy
		redirect_to request.referrer
	end

	private

  	def article_params
    	params.require(:article).permit(:title, :text)
  	end

end

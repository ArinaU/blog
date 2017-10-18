class ArticlesController < ApplicationController
	load_and_authorize_resource

	before_action :authenticate_user!, except: [:index, :show]

	def index
		@articles = Article.order('created_at DESC').limit(10)
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

	def update
  	@article = Article.find(params[:id])
 
  	if @article.update(article_params)
    	redirect_to @article
  	else
    	render 'edit'
  	end
	end

	private

  	def article_params
    	params.require(:article).permit(:title, :text)
  	end

end

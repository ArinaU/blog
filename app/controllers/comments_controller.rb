class CommentsController < ApplicationController
  
	before_action :authenticate_user!
	load_and_authorize_resource

	def create
		@article = Article.find(params[:article_id])
		@current_user = current_user
		@comment = @article.comments.create(comment_params)

		redirect_to article_path(@article)
	end

	private

	def comment_params
    	params.require(:comment).permit(:body)
  	end

end

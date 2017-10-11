class CommentsController < ApplicationController
	load_and_authorize_resource

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)

		redirect_to article_path(@article)
	end

	private

	def comment_params
    	params.require(:comment).permit(:author, :body)
  	end

end

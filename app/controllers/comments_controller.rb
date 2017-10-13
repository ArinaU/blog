class CommentsController < ApplicationController
  
	before_action :authenticate_user!
	load_and_authorize_resource

	def new
	end

	def create
 	  @article = Article.find(params[:article_id])
 	  @comment = @article.comments.build(comment_params)
 	  @comment.user = current_user
 	  @comment.save
 	  redirect_to article_path(@article)
 	end

 	def show
 		@comment = Comment.find(params[:id])
    @user = @comment.user
 	end

 	def edit
 	end

 	def update
 		@comment = Comment.find(params[:id])
 
  	if @comment.update(comment_params)
    	redirect_to @comment
  	else
    	render 'edit'
  	end
 	end
 
 	private
 
 	def comment_params
    params.require(:comment).permit(:body)
  end
end

class CommentsController < ApplicationController
  
	before_action :authenticate_user!
  before_action :get_article, only: [:create, :edit, :update]
  before_action :get_comment, only: [:show, :edit, :update]

	load_and_authorize_resource

  def get_article
    @article = Article.find(params[:article_id])
  end

  def get_comment
    @comment = Comment.find(params[:id])
  end

	def new
	end

	def create
 	  @comment = @article.comments.build(comment_params)
 	  @comment.user = current_user
 	  @comment.save
 	  redirect_to article_path(@article)
 	end

 	def show
    @user = @comment.user
 	end

 	def edit
 	end

 	def update
  	if @comment.update(comment_params)
    	redirect_to @article
  	else
    	render 'edit'
  	end
 	end
 
 	private
 
 	def comment_params
    params.require(:comment).permit(:body)
  end
end

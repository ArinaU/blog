class CommentsController < ApplicationController
  
	before_action :authenticate_user!
  before_action :get_article, only: [:create, :edit, :update]
  before_action :get_comment, only: [:show, :edit, :update, :update_is_deleted_flag, :destroy]
  #before_destroy :update_is_deleted_flag

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


  def destroy
    #Comment.find(params[:id]).destroy
    #:update_is_deleted_flag
    #@comment.save
    #redirect_to request.referrer
    @comment.update_attributes(is_deleted: true)
  end

 	def update
  	if @comment.update(comment_params)
    	redirect_to @article
  	else
    	render 'edit'
  	end
 	end
 
 	private

  def get_article
    @article = Article.find(params[:article_id])
  end

  def get_comment
    @comment = Comment.find(params[:id])
  end
 
 	def comment_params
    params.require(:comment).permit(:body)
  end

  def update_is_deleted_flag
    @comment.update_attributes(is_deleted: true)
  end

end

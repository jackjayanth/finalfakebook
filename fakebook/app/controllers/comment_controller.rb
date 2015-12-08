class CommentController < ApplicationController
  def get
    #@comment = Comment.where(:post_id => params[:post_id])
    @comments = Comment.all
    respond_to do |format|
      format.json {render json: @comments}
    end
  end

  def post
    @comment = Comment.create(:post_id => params[:post_id], :user_id=> params[:user_id], :text=>params[:text])
    respond_to do |format|
      format.json {render json: @comment}
    end
  end

  def edit
    @comment = Comment.update(params[:comment_id], :text => params[:text])
    respond_to do |format|
      format.json {render json: @comment}
    end
  end

  def delete
    @comment = Comment.destroy(params[:comment_id])
    respond_to do |format|
      format.json {render json: @comment}
    end
  end
end

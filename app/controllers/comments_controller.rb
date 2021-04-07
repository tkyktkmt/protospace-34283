class CommentsController < ApplicationController
  def create 
    binding.pry
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype_id)
    else  
      # @prototype =  Prototype.find(params[:prototype_id])
      @prototype =  @comment.prototype
      # @comments = @prototype.comments.includes(:user)
      @comments = @prototype.comments
      # @comment = Comment.new は不要？
      render "prototypes/show"
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end 
end

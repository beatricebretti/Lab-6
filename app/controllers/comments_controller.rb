class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
  
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.author = current_user.email
      if @comment.save
        redirect_to post_path(@post), notice: "Comment added."
      else
        redirect_to post_path(@post), alert: "Comment failed to save."
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
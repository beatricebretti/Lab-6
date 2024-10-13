class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
    load_and_authorize_resource
  
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

    def edit
      @comment = Comment.find(params[:id])
    end
  
    def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to post_path(@comment.post), notice: "Comment was successfully updated."
      else
        render :edit
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to post_path(@comment.post), notice: "Comment was successfully deleted."
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
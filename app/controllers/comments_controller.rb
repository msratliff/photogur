class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]

  def create
    if current_user

      @comment = @post.comments.create(params[:comment].permit(:content))
      @comment.user_id = current_user.id
      @comment.save

      if @comment.save
        redirect_to post_path(@post)
      else
        render'new'
      end

    else
      redirect_to login_path
    end

  end

  def destroy
    if current_user && (current_user.id == @comment.user.id || current_user.admin?)
      @comment.destroy
      redirect_to post_path(@post)
    else
      redirect_to @post, notice: 'This is not your comment'
    end

  end

  def edit
  end

  def update
    if current_user && (current_user.id == @comment.user.id || current_user.admin?)

      if @comment.update(params[:comment].permit(:content))
        redirect_to post_path(@post)
      else
        render 'edit'
      end

    else
      redirect_to @post, notice: 'This is not your comment'
    end

  end

  private
  def find_post
    @post = Post.find(params[:post_id])

  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:notice] = "You shall not pass!"
      redirect_to @post
    end
  end

end

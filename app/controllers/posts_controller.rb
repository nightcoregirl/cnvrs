class PostsController < ApplicationController

	def index
		@posts = Post.order(created_at: :desc).all
	end

  def show
    @post = Post.find params[:id]
  end

  def create
    post = Post.create params.require(:post).permit(:title, :body)
    redirect_to post_url(post)
  end

  def destroy
    Post.destroy params[:id]
    redirect_to posts_url
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.update params.require(:post).permit(:title, :body)
    redirect_to posts_url
  end

end


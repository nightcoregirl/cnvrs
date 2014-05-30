class PostsController < ApplicationController
	def index
		@posts = Post.order(created_at: :desc).all
	end

  def new
    @post = Post.new
  end
  
  def create
    post = Post.create post_params
    redirect_to post_url(post)
  end

  def show
    load_post
  end

  def destroy
    load_post
    @post.destroy
    redirect_to posts_url
  end

  def edit
    load_post
  end

  def update
    load_post
    @post.update post_params
    redirect_to posts_url
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :subtitle)
    end

    def load_post
      @post = Post.find params[:id]    
    end

end


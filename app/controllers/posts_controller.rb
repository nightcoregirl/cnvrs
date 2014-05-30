class PostsController < ApplicationController

	def index 
		post = Post.all
		# render text:'tests'
		# render json:post 
	end 




end

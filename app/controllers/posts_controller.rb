

class PostsController < ApplicationController
	def index

		client = Twitter::Streaming::Client.new do |config|
		  config.consumer_key        = "FhmuzdXsyO0Dcmi2PHaEVMwyd"
		  config.consumer_secret     = "HnYXHbEHvYK01OZQ7MY4bPpk4goNXz1Mp2treexAlQQRVswspX"
		  config.access_token        = "4514751-s0utoCj0ppJ5a8lLUgIBp5KUFFDjKSRkBDbPW5TTJf"
		  config.access_token_secret = "ru0cP8fyEWRd4nt7vFz0433lvTaNkec4TpAndNyHnKeDx"
		end		
		@tweets = []
		client.sample do |object|
		  @tweets << object if object.is_a?(Twitter::Tweet)
		  break if @tweets.count == 10
		end	
	end
end


class ListsController < ApplicationController
	def index
		@lists = Lists.all
 	end

 	def new
  	end 
 	def skip_login? 
		false
	end
end
class ListsController < ApplicationController
	def index
		@lists = List.all
 	end

 	def new
  	end 

 	def skip_login? 
		false
	end
end

class ListsController < ApplicationController
	def index
		me = User.find_by(:netid => session[:cas_user])[:id]
		@lists = List.find_by(:user_id => me)

		if @lists.nil?
			@lists = Array.new
		end
	end

	def new
	end 

	def create
		# @lists = List.new(params[list_params])

		# @lists.save
		# redirect_to @lists
		me = session[:cas_user]

		if !User.exists?(:netid => me)
			@newUser = User.new
			@newUser.netid = me
			@newUser.save
		end

		thisUserNewList = List.new
		thisUserNewList.name = params[:list][:name]
		thisUserNewList.organization = params[:list][:organization]
		thisUserNewList.user_id = User.find_by(:netid => me)[:id]

		thisUserNewList.save

		me = User.find_by(:netid => session[:cas_user])[:id]
		@lists = List.where(:user_id => me).all

		if @lists.nil?
			@lists = Array.new
		end

		render 'index'
	end

	def show
		@lists = List.find(params[:id])
	end

	private
	def list_params
		params.require(:list).permit(:name, :organization, :netIDowner)
	end

	def skip_login? 
		false
	end
end

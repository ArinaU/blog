class UsersController < ApplicationController
	load_and_authorize_resource

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
	end

end

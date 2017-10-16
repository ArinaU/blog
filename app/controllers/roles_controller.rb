class RolesController < ApplicationController

load_and_authorize_resource

def new
  @role = Role.new
end

def create
  @role = Role.new(role_params)
end

private
  def set_role
    @role = Role.find(params[:id])
  end
end

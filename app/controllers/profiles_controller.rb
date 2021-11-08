class ProfilesController < ApplicationController
  def index
    @users = User.all.search(params[:search])
    return if params[:search].nil?
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
  end
end

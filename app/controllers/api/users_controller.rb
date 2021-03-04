class Api::UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
    )
    @user.save
    if @user.save
      render "show.json.jb"
    else
      render json: @user.errors.full_messages
    end
  end
  
end

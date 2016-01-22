class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :correct_user,       only: [:show]
  before_action :find_user,          only: [:show]

  def show; end

  private

  def correct_user
    if current_user != User.find_by(id: params[:id])
      redirect_to root_url
    end
  end

  def find_user
    @user = User.find(params[:id])
  end
end

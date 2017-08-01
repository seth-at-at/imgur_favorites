class UserController < ApplicationController
  def index
    # @current_user = current_user
    @user = current_user
    @folders = Folder.where(user_id: @user.id)
  end
end

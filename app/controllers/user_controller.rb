class UserController < ApplicationController
  def index
    @user = current_user
    @folders = Folder.where(user_id: @user.id)
  end
end

class FoldersController < ApplicationController
  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.create(name: params[:folder][:name], user: current_user)
    redirect_to folder_path(@folder)
  end

  def show
    @folder = Folder.find(params[:id])
  end

  private
    def folder_params(params)
      params.require(:folder).permit(:name)
    end
end

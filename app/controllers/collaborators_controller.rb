class CollaboratorsController < ApplicationController

before_action :authenticate_user!

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by(email: params[:user_email])
    collab_exists = Collaborator.where(wiki: @wiki, user: @user).any?
    @collaborator = Collaborator.find_or_create_by(wiki: @wiki, user: @user)

    if collab_exists
      flash[:alert] = "Collaborator already exists."
      redirect_to edit_wiki_path(@wiki) and return
    end

    if @collaborator.valid?
      flash[:notice] = "Collaborator added."
      redirect_to @wiki
    else
      flash[:error] = "There was an error adding the collaborator."
      redirect_to edit_wiki_path(@wiki)
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by(email: params[:user_email])
    @collaborator = Collaborator.find_by(wiki: @wiki, user: @user)

    if @collaborator.destroy
      flash[:notice] = "Collaborator removed."
      redirect_to @wiki
    else
      flash[:error] = "There was an error removing the collaborator."
      redirect_to edit_wiki_path
    end
  end
end

class UsersController < ApplicationController

  def downgrade
    User.transaction do
      current_user.update_attribute(:role, 'standard')
      current_user.wikis.update_all(private: false)
    end
    flash[:notice] = "You have downgraded to Standard."
    redirect_to root_path(current_user)
  end

end

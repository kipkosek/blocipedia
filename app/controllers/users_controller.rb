class UsersController < ApplicationController

  def downgrade
    current_user.update_attribute(:role, 'standard')
    flash[:notice] = "You have downgraded to Standard."
    redirect_to root_path(current_user)
  end
  
end

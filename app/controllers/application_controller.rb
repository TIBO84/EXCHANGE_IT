class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pundit

  def after_sign_in_path_for(resource)
    # return the path based on resource
    if current_user.manager
      supervise_path
    else
      dashboard_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
    # return the path based on resource
  end



  # Pundit: white-list approach.
  #fter_action :verify_authorized, except: :index, unless: :skip_pundit?
  #after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  #private

  #def skip_pundit?
    #devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  #end

end

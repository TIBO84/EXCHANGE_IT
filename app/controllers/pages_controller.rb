class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
      if current_user.manager
        redirect_to supervise_path
      else
      redirect_to dashboard_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end

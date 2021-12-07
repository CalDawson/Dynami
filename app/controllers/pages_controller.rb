class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    user_signed_in? ? (redirect_to posts_path) : (redirect_to new_user_session_path)
  end
end

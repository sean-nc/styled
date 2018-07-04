class ApplicationController < ActionController::Base
  require 'will_paginate/array'
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation,
                   :remember_me, :gender, :description, :avatar, :avatar_cache, :remove_avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def logged_in?
    unless user_signed_in?
      flash[:alert] = "Please log in."
      redirect_to new_user_session_path
    end
  end

  def correct_user?
    @user = User.find(@post.user_id)
    unless @user == current_user
      flash[:alert] = "You're not allowed to do that"
      redirect_to @user
    end
  end
end
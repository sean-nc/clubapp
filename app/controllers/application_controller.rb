class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_authorized?
  skip_before_action :user_authorized?, if: :devise_controller?

  protected
    def configure_permitted_parameters
      added_attrs = [:username, :email, :password, :password_confirmation, :remember_me,
                     :first_name, :last_name, :date_of_birth, :gender]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

  private
    def user_authorized?
      redirect_to new_user_session_path unless current_user
      flash[:notice] = 'Please sign in.'
    end

    def venue_authorization
      authorize @venue
    end
end

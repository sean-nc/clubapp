class StaticPagesController < ApplicationController
  skip_before_action :user_authorized?

  def home
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    flash[:notice] = nil
    flash[:alert] = nil
  end
end

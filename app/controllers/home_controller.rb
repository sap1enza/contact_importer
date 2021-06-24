class HomeController < ApplicationController
  def index
    @contacts = Contact.order(created_at: :desc).paginate(page: params[:page])
  end
end

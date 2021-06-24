require 'csv'

class ImportsController < ApplicationController
  include ImportsHelper

  before_action :block_access, except: [:destroy]

  def index; end

  def get_headers
    csv_file = CSV.read(params[:import][:file], headers: true)

    respond_to do |format|
      format.json { render json: { headers: csv_file.headers, contact_columns: contact_columns } }
    end
  end

  def create
    flash[:success] = 'Imported Successfully'

    # TODO: Create importing

    render :index
  end

  private

  def permitted_params
    params.require(:import).permit(contact_columns + :file)
  end
end

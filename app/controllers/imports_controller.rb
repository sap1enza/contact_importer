require 'csv'

class ImportsController < ApplicationController
  include ImportsHelper

  before_action :block_access, except: %i[destroy]
  before_action :fetch_imports, only: %i[index create]

  def index; end

  def show
    @import = Import.find(params[:id])
  end

  def get_headers
    csv_file = CSV.read(params[:import][:file], headers: true)

    respond_to do |format|
      format.json { render json: { headers: csv_file.headers, contact_columns: contact_columns } }
    end
  end

  def create
    import = Import.new(user: current_user)
    import.file.attach(params[:import][:file])

    if import.save
      ImportingJob.perform_later(import.id, permitted_params)

      flash[:success] = 'Import Queued Successfully'
    else
      flash[:warning] = 'Import Failed'
    end

    redirect_to imports_path
  end

  private

  def fetch_imports
    @imports = Import.where(user: current_user).order(created_at: :desc).paginate(page: params[:page])
  end

  def permitted_params
    params.require(:import).permit(contact_columns)
  end
end

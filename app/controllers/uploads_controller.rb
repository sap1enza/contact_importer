class UploadsController < ApplicationController
  before_action :block_access, except: [:destroy]

  def index; end
end

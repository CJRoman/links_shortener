class LinksController < ApplicationController
  before_action :set_link, only: %i[ show ]

  # GET /links/1 or /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # POST /links or /links.json
  def create
    service_result = Links::CreateService.new(link_params).call

    respond_to do |format|
      if service_result[:status]
        format.html { redirect_to link_url(service_result[:link].id), notice: "Here is your short link:" }
        format.json { render :show, status: :created, location: service_result[:link] }
      else
        format.html { redirect_to new_link_path }
        format.json { render json: service_result[:link].errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:full_link)
    end
end

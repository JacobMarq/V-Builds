class Api::V1::ComponentResourceController < Api::V1::ApplicationController
  before_action :set_component_resource, only: %i[ show update destroy ]

  # GET /component_resources
  def index
    @component_resources = ComponentResource.all

    render json: @component_resourcess
  end

  # GET /component_resources/1
  def show
    render json: @component_resource
  end

  # POST /component_resources
  def create
    @component_resource = ComponentResource.new(component_resource_params)

    if @component_resource.save
      render json: @component_resource, status: :created, location: @component_resource
    else
      render json: @component_resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /component_resources/1
  def update
    if @component_resource.update(component_resource_params)
      render json: @component_resource
    else
      render json: @component_resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /component_resources/1
  def destroy
    @component_resource.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_resource
      @component_resource = ComponentResource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def component_resource_params
      params.require(:component_resource).permit(:component_id, :ub_rank, :ub_benchmark, :ub_samples, :ub_link, :ne_rank)
    end
end

class BuildComponentsController < ApplicationController
  before_action :set_build_component, only: %i[ show update destroy ]

  # GET /build_components
  def index
    @build_components = BuildComponent.all

    render json: @build_components
  end

  # GET /build_components/1
  def show
    render json: @build_component
  end

  # POST /build_components
  def create
    @build_component = BuildComponent.new(build_component_params)

    if @build_component.save
      render json: @build_component, status: :created, location: @build_component
    else
      render json: @build_component.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /build_components/1
  def update
    if @build_component.update(build_component_params)
      render json: @build_component
    else
      render json: @build_component.errors, status: :unprocessable_entity
    end
  end

  # DELETE /build_components/1
  def destroy
    @build_component.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_build_component
      @build_component = BuildComponent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def build_component_params
      params.require(:build_component).permit(:build_id, :component_id)
    end
end

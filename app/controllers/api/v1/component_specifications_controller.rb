class Api::V1::ComponentSpecificationsController < Api::V1::ApplicationController
  before_action :set_component_specification, only: %i[ show update destroy ]

  # GET /component_specifications
  def index
    @component_specifications = ComponentSpecification.all

    render json: @component_specifications
  end

  # GET /component_specifications/1
  def show
    render json: @component_specification
  end

  # POST /component_specifications
  def create
    @component_specification = ComponentSpecification.new(component_specification_params)

    if @component_specification.save
      render json: @component_specification, status: :created, location: @component_specification
    else
      render json: @component_specification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /component_specifications/1
  def update
    if @component_specification.update(component_specification_params)
      render json: @component_specification
    else
      render json: @component_specification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /component_specifications/1
  def destroy
    @component_specification.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_specification
      @component_specification = ComponentSpecification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def component_specification_params
      params.require(:component_specification).permit(:component_id, :specification_option_id)
    end
end

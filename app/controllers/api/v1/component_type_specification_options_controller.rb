class Api::V1::ComponentTypeSpecificationOptionsController < Api::V1::ApplicationController
  before_action :set_component_type_specification_option, only: %i[ show update destroy ]

  # GET /component_type_specification_options
  def index
    @component_type_specification_options = ComponentTypeSpecificationOption.all

    render json: @component_type_specification_options
  end

  # GET /component_type_specification_options/1
  def show
    render json: @component_type_specification_option
  end

  # POST /component_type_specification_options
  def create
    @component_type_specification_option = ComponentTypeSpecificationOption.new(component_type_specification_option_params)

    if @component_type_specification_option.save
      render json: @component_type_specification_option, status: :created, location: @component_type_specification_option
    else
      render json: @component_type_specification_option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /component_type_specification_options/1
  def update
    if @component_type_specification_option.update(component_type_specification_option_params)
      render json: @component_type_specification_option
    else
      render json: @component_type_specification_option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /component_type_specification_options/1
  def destroy
    @component_type_specification_option.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_type_specification_option
      @component_type_specification_option = ComponentTypeSpecificationOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def component_type_specification_option_params
      params.require(:component_type_specification_option).permit(:component_id, :type_id, :specification_id, :option_id)
    end
end
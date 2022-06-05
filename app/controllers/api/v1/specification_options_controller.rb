class Api::V1::SpecificationOptionsController < Api::V1::ApplicationController
  before_action :set_specification_option, only: %i[ show update destroy ]

  # GET /specification_options
  def index
    @specification_options = SpecificationOption.all

    render json: @specification_options
  end

  # GET /specification_options/1
  def show
    render json: @specification_option
  end

  # POST /specification_options
  def create
    @specification_option = SpecificationOption.new(specification_option_params)

    if @specification_option.save
      render json: @specification_option, status: :created, location: @specification_option
    else
      render json: @specification_option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /specification_options/1
  def update
    if @specification_option.update(specification_option_params)
      render json: @specification_option
    else
      render json: @specification_option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /specification_options/1
  def destroy
    @specification_option.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specification_option
      @specification_option = SpecificationOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def specification_option_params
      params.require(:specification_option).permit(:specification_id, :option_id)
    end
end

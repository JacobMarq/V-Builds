class Api::V1::SpecificationsController < Api::V1::ApplicationController
  before_action :set_specification, only: %i[ show update destroy ]

  # GET /specifications
  def index
    @specifications = Specification.all

    render json: @specifications
  end

  # GET /specifications/1
  def show
    render json: @specification
  end

  # POST /specifications
  def create
    @specification = Specification.new(specification_params)

    if @specification.save
      render json: @specification, status: :created, location: @specification
    else
      render json: @specification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /specifications/1
  def update
    if @specification.update(specification_params)
      render json: @specification
    else
      render json: @specification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /specifications/1
  def destroy
    @specification.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specification
      @specification = Specification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def specification_params
      params.require(:specification).permit(:name)
    end
end

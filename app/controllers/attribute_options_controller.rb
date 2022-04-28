class AttributeOptionsController < ApplicationController
  before_action :set_attribute_option, only: %i[ show update destroy ]

  # GET /attribute_options
  def index
    @attribute_options = AttributeOption.all

    render json: @attribute_options
  end

  # GET /attribute_options/1
  def show
    render json: @attribute_option
  end

  # POST /attribute_options
  def create
    @attribute_option = AttributeOption.new(attribute_option_params)

    if @attribute_option.save
      render json: @attribute_option, status: :created, location: @attribute_option
    else
      render json: @attribute_option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attribute_options/1
  def update
    if @attribute_option.update(attribute_option_params)
      render json: @attribute_option
    else
      render json: @attribute_option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attribute_options/1
  def destroy
    @attribute_option.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute_option
      @attribute_option = AttributeOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attribute_option_params
      params.require(:attribute_option).permit(:attribute_id, :option_id)
    end
end

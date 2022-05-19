class Api::V1::TypeAttributesController < Api::V1::ApplicationController
  before_action :set_type_attribute, only: %i[ show update destroy ]

  # GET /type_attributes
  def index
    @type_attributes = TypeAttribute.all

    render json: @type_attributes
  end

  # GET /type_attributes/1
  def show
    render json: @type_attribute
  end

  # POST /type_attributes
  def create
    @type_attribute = TypeAttribute.new(type_attribute_params)

    if @type_attribute.save
      render json: @type_attribute, status: :created, location: @type_attribute
    else
      render json: @type_attribute.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /type_attributes/1
  def update
    if @type_attribute.update(type_attribute_params)
      render json: @type_attribute
    else
      render json: @type_attribute.errors, status: :unprocessable_entity
    end
  end

  # DELETE /type_attributes/1
  def destroy
    @type_attribute.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_attribute
      @type_attribute = TypeAttribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_attribute_params
      params.require(:type_attribute).permit(:type_id, :attribute_id)
    end
end

class Api::V1::ComponentInventoriesController < Api::V1::ApplicationController
  before_action :set_component_inventory, only: %i[ show update destroy ]

  # GET /component_inventories
  def index
    @component_inventories = ComponentInventory.all

    render json: @component_inventories
  end

  # GET /component_inventories/1
  def show
    render json: @component_inventory
  end

  # POST /component_inventories
  def create
    @component_inventory = ComponentInventory.new(component_inventory_params)

    if @component_inventory.save
      render json: @component_inventory, status: :created, location: @component_inventory
    else
      render json: @component_inventory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /component_inventories/1
  def update
    if @component_inventory.update(component_inventory_params)
      render json: @component_inventory
    else
      render json: @component_inventory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /component_inventories/1
  def destroy
    @component_inventory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_inventory
      @component_inventory = ComponentInventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def component_inventory_params
      params.require(:component_inventory).permit(:quantity)
    end
end

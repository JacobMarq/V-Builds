class Api::V1::TypicalUsagesController < Api::V1::ApplicationController
  before_action :set_typical_build_usage, only: %i[ show update destroy ]

  # GET /typical_usages
  def index
    @typical_usages = TypicalUsage.all

    render json: @typical_usages
  end

  # GET /typical_usages/1
  def show
    render json: @typical_usage
  end

  # POST /typical_usages
  def create
    @typical_usage = TypicalUsage.new(typical_build_usage_params)

    if @typical_usage.save
      render json: @typical_usage, status: :created, location: @typical_usage
    else
      render json: @typical_usage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /typical_usages/1
  def update
    if @typical_usage.update(typical_build_usage_params)
      render json: @typical_usage
    else
      render json: @typical_usage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /typical_usages/1
  def destroy
    @typical_usage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typical_usage
      @typical_usage = TypicalUsage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def typical_usage_params
      params.require(:typical_usage).permit(:title, :description, :gpu_precedent, :cpu_precedent, :ram_space_suggestion)
    end
end

class Api::V1::TypicalBuildUsagesController < Api::V1::ApplicationController
  before_action :set_typical_build_usage, only: %i[ show update destroy ]

  # GET /typical_build_usages
  def index
    @typical_build_usages = TypicalBuildUsage.all

    render json: @typical_build_usages
  end

  # GET /typical_build_usages/1
  def show
    render json: @typical_build_usage
  end

  # POST /typical_build_usages
  def create
    @typical_build_usage = TypicalBuildUsage.new(typical_build_usage_params)

    if @typical_build_usage.save
      render json: @typical_build_usage, status: :created, location: @typical_build_usage
    else
      render json: @typical_build_usage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /typical_build_usages/1
  def update
    if @typical_build_usage.update(typical_build_usage_params)
      render json: @typical_build_usage
    else
      render json: @typical_build_usage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /typical_build_usages/1
  def destroy
    @typical_build_usage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typical_build_usage
      @typical_build_usage = TypicalBuildUsage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def typical_build_usage_params
      params.require(:typical_build_usage).permit(:title, :description, :gpu_precedent, :cpu_precedent, :ram_space_suggestion)
    end
end

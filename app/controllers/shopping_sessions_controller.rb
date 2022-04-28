class ShoppingSessionsController < ApplicationController
  before_action :set_shopping_session, only: %i[ show update destroy ]

  # GET /shopping_sessions
  def index
    @shopping_sessions = ShoppingSession.all

    render json: @shopping_sessions
  end

  # GET /shopping_sessions/1
  def show
    render json: @shopping_session
  end

  # POST /shopping_sessions
  def create
    @shopping_session = ShoppingSession.new(shopping_session_params)

    if @shopping_session.save
      render json: @shopping_session, status: :created, location: @shopping_session
    else
      render json: @shopping_session.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shopping_sessions/1
  def update
    if @shopping_session.update(shopping_session_params)
      render json: @shopping_session
    else
      render json: @shopping_session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shopping_sessions/1
  def destroy
    @shopping_session.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_session
      @shopping_session = ShoppingSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_session_params
      params.require(:shopping_session).permit(:user_id, :total)
    end
end

class PaymentDetailsController < ApplicationController
  before_action :set_payment_detail, only: %i[ show update destroy ]

  # GET /payment_details
  def index
    @payment_details = PaymentDetail.all

    render json: @payment_details
  end

  # GET /payment_details/1
  def show
    render json: @payment_detail
  end

  # POST /payment_details
  def create
    @payment_detail = PaymentDetail.new(payment_detail_params)

    if @payment_detail.save
      render json: @payment_detail, status: :created, location: @payment_detail
    else
      render json: @payment_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payment_details/1
  def update
    if @payment_detail.update(payment_detail_params)
      render json: @payment_detail
    else
      render json: @payment_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payment_details/1
  def destroy
    @payment_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_detail
      @payment_detail = PaymentDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_detail_params
      params.require(:payment_detail).permit(:amount, :provider, :status)
    end
end

class UserBuildsController < ApplicationController
  before_action :set_user_build, only: %i[ show update destroy ]

  # GET /user_builds
  def index
    @user_builds = UserBuild.all

    render json: @user_builds
  end

  # GET /user_builds/1
  def show
    render json: @user_build
  end

  # POST /user_builds
  def create
    @user_build = UserBuild.new(user_build_params)

    if @user_build.save
      render json: @user_build, status: :created, location: @user_build
    else
      render json: @user_build.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_builds/1
  def update
    if @user_build.update(user_build_params)
      render json: @user_build
    else
      render json: @user_build.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_builds/1
  def destroy
    @user_build.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_build
      @user_build = UserBuild.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_build_params
      params.require(:user_build).permit(:user_id, :build_id)
    end
end

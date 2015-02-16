class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @current_page = params.fetch(:page, 0).to_i
    @users = User.limit(20)
                 .offset(20 * params[:page].to_i)
                 .order(params.fetch(:sort, :id))
    # WE HAVE TO USE THE CODE BELOW SO THE SORT METHOD CAN WORK
    #@users = User.order(:profile_name).page params[:page]
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

# private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:profile_name)
    end
end

class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit]

    def index

      @posts = Post.new
    # @current_page = params.fetch(:page, 0).to_i
    # @users = User.limit(20)
    #              .offset(20 * params[:page].to_i)
    #              .order(params.fetch(:sort, :id))
    # WE HAVE TO USE THE CODE BELOW SO THE SORT METHOD CAN WORK
    #@users = User.order(:profile_name).page params[:page]

  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:post).permit(:movie_title, :url, :description)
    end

  end
end

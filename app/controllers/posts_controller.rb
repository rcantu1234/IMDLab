class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit]

  def index

      @posts = Post.all
    @current_page = params.fetch(:page, 0).to_i
    @users = User.limit(20)
                 .offset(20 * params[:page].to_i)
                 .order(params.fetch(:sort, :id))

    @users = User.order(:profile_name).page params[:page]
  end

  def show
  end

  # GET /users/new
  def new
    @post = Post.new
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:movie_title, :url, :description)
    end
end

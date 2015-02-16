class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit]

  def index
    @current_page = params.fetch(:page, 0).to_i
    posts = Post.limit(20)
                 .offset(20 * params[:page].to_i)
                 .order(params.fetch(:sort, :id))
    # WE HAVE TO USE THE CODE BELOW SO THE SORT METHOD CAN WORK
    @posts = Post.order(:url).page params[:page]
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
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
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

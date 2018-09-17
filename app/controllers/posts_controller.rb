class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  skip_before_action :verify_authenticity_token
  
  

  # # GET /posts
  # # GET /posts.json
  def index
    redirect_to '/'
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end


  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new
    @post.title = post_params[:title]
    @post.content = post_params[:content]
    @post.users_id = current_user.id
    
    if(post_params[:is_published])
      @post.is_published = post_params[:is_published]
    end
    
    respond_to do |format|
      if @post.save
        message = {id: @post.id}
        format.json { render json: message}
      else
        return format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        message = {status: "successfull"}
        format.json { render json: message}
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :users_id, :is_published)
    end
end

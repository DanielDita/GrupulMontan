class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :edit, :update, :destroy, :like, :dislike]
  before_action :owned_post, only: [:edit, :update, :destroy]
  impressionist actions: [:show], unique: [:session_hash]


  def index
    @posts = Post.where(["title LIKE ?","%#{params[:search]}%"]).all.order("created_at desc").paginate(page: params[:page], per_page: 5)
  end

  def new
    @post = current_user.posts.build
    @posts = Post.all.order("created_at desc")
    authorize! :write, @post
  end

  def create
    @posts = Post.all.order("created_at desc")
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Postarea a fost salvata"
    else
      render 'new', notice: "Oh nu, postarea nu a fost salvata!"
    end
  end

  def show

    @comments = Comment.where(post_id: @post)
    @posts = Post.friendly.find(params[:id])
    authorize! :read, @post
    impressionist(@post)

  end

  def edit
    @posts = Post.all.order("created_at desc")
  end

  def update
    @posts = Post.all.order("created_at desc")
    if @post.update post_params
      redirect_to @post, notice: "Succes! Postarea a fost salvata!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def like
    if @post.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def dislike
    if @post.disliked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end

  def owned_post
  unless current_user == @post.user
    flash[:alert] = "That post doesn't belong to you!"
    redirect_to root_path
  end
end
end

class ArticlesController < ApplicationController
  load_and_authorize_resource
  def index
    @posts = Post.all.limit(5).order("created_at desc").page(params[:page]).order('created_at DESC')

  end

end

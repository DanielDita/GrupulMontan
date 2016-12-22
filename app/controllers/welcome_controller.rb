class WelcomeController < ApplicationController
  def index
    @events = Event.all.limit(3).order("created_at desc")
    @posts = Post.all.limit(5).order("created_at desc")
    @pins = Pin.all.limit(3).order("created_at desc")
  end
end

class PostsController < ApplicationController
  def index
    @posts = Post.reposted
  end

  def feed
    @title = "Steve a Day"
    @posts = Post.reposted
    @updated = @posts.first.reposted_at unless @posts.empty?

    respond_to do |format|
      format.atom { render :layout => false }
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
end

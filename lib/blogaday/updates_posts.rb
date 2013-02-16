module Blogaday
  class UpdatesPosts
    def go!
      # Add any posts that aren't in the db
      posts.each do |post|
        add_post post unless post_exists? post
      end
    end


    private

    def posts
      @posts ||= FetchesPosts.go!
    end

    def add_post(post)
      Post.create! title: post.title, url: post.url
    end

    def post_exists?(post)
      Post.where(title: post.title, url: post.url).present?
    end
  end
end

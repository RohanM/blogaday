module Blogaday
  class PublishesPosts
    # If there's an unpublished post in the last week, publish it
    # Else publish a random unpublished post
    def self.go!
      post = select_post
      publish post if post
    end


    private

    def self.select_post
      recent_unpublished_post || random_unpublished_post
    end

    def self.recent_unpublished_post
      post = Post.last
      post.reposted_at.nil? ? post : nil
    end

    def self.random_unpublished_post
      Post.where('reposted_at IS NULL').order('RANDOM()').first
    end


    def self.publish(post)
      post.reposted_at = Time.now
      post.save!
    end
  end
end

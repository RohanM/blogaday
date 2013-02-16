require 'open-uri'

module Blogaday
  class FetchesPosts
    def self.go!
      archives = Nokogiri::HTML(open('http://www.stevepavlina.com/blog/archives/'))
      posts = archives.css('#content li a')
      posts.map { |post| {title: post.content, url: post.attr('href')} }
    end
  end
end

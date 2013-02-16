atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @posts.each do |post|
    feed.entry(post, :url => post.url) do |entry|
      entry.url post.url
      entry.title post.title
      entry.updated post.reposted_at.strftime("%Y-%m-%dT%H:%M:%SZ")
    end
  end
end

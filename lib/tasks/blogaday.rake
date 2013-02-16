require 'blogaday/updates_posts'
require 'blogaday/publishes_posts'

namespace :blogaday do
  task :nightly_cron => :environment do
    Blogaday::UpdatesPosts.go!
    Blogaday::PublishesPosts.go!
  end
end

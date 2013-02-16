require 'blogaday/updates_posts'
require 'blogaday/publishes_posts'

namespace :blogaday do
  task :nightly_cron => :environment do
    Blogaday::UpdatesPosts.new.go!
    #Blogaday::PublishesPosts.go!
  end
end

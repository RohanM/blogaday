class Post < ActiveRecord::Base
  attr_accessible :title, :url

  validates_presence_of :title, :url

  scope :reposted, where('reposted_at IS NOT NULL').order('reposted_at ASC')
end

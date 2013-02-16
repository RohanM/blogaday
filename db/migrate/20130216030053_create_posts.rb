class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.datetime :reposted_at

      t.timestamps
    end
  end
end

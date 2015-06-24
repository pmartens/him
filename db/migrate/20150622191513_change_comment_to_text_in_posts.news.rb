# This migration comes from news (originally 20150622191034)
class ChangeCommentToTextInPosts < ActiveRecord::Migration
  def change
    change_column :news_posts, :comment, :text
  end
end

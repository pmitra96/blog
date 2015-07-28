class AddLikecountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :likecount, :integer
  end
end

class AddMetaTagsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :metatag_title, :string
    add_column :articles, :metatag_description, :string
  end
end

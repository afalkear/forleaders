class AddUrlNameToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :url_name, :string
  end
end

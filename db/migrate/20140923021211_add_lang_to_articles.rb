class AddLangToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :lang, :string
  end
end

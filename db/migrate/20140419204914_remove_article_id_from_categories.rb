class RemoveArticleIdFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :article_id
  end
end

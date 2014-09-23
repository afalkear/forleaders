class AddArticleLanguageIdtoArticle < ActiveRecord::Migration
  def change
    add_column :articles, :article_language_id, :integer
  end
end

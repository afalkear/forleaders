class CreateArticleLanguages < ActiveRecord::Migration
  def change
    create_table :article_languages do |t|
      t.timestamps
    end
  end
end

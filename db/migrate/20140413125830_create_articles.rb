class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :content
      t.integer :tag_id
      t.integer :category_id

      t.timestamps
    end
  end
end

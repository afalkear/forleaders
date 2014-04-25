class AddHoverFraseToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :hover_frase, :string
  end
end

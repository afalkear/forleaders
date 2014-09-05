class AddDebugTranslationsToUser < ActiveRecord::Migration
  def change
    add_column :users, :debug_translations, :string
  end
end

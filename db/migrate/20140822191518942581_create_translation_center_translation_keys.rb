class CreateTranslationCenterTranslationKeys < ActiveRecord::Migration
  def change
    create_table :translation_center_translation_keys do |t|
      t.string :name
      t.integer :category_id
      t.datetime :last_accessed
      
      t.string :en_status, default: 'untranslated'
      
      t.string :pt_status, default: 'untranslated'
      
      t.string :es_status, default: 'untranslated'
      
      t.string :fr_status, default: 'untranslated'
      

      t.timestamps
    end

    add_index :translation_center_translation_keys, :name
  end
end

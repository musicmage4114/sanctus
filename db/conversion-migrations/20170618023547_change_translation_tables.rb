class ChangeTranslationTables < ActiveRecord::Migration[5.1]
  def change
    rename_table :trnTranslationLanguages, :languages
    change_table :languages do |t|
      t.rename :numericLanguageID, :numeric_language_id
      t.rename :languageID, :string_language_id
      t.rename :languageName, :name
    end
    
    drop_table :translationTables do |t|
      t.string :sourceTable, limit: 200
      t.string :destinationTable, limit: 200
      t.string :translatedKey, limit: 200
      t.integer :tcGroupID
      t.integer :tcID
    end
    
    drop_table :trnTranslationColumns do |t|
      t.integer :tcID, null: false, index: { unique: true }
      t.string :tableName, limit: 256
      t.string :columnName, limit: 128
      t.string :masterID, limit: 128
    end
    
    drop_table :trnTranslations do |t|
      t.integer :tcID
      t.integer :keyID
      t.string :languageID, limit: 50
      t.text :text
    end
  end
end

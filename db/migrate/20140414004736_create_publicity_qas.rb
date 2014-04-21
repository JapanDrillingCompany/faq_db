class CreatePublicityQas < ActiveRecord::Migration
  def change
    create_table :publicity_qas do |t|
      t.string :category1
      t.string :category2
      t.text :question
      t.text :answer
      t.text :note
      t.references :qa_category
      t.integer :user_id
      t.string :reffile_file_name
      t.string :reffile_content_type
      t.integer :reffile_file_size
      t.datetime :reffile_updated_at
      t.integer :classification_type_id
      t.integer :category_type_id
      t.integer :rate

      t.timestamps
    end
    add_index :publicity_qas, :qa_category_id
  end
end

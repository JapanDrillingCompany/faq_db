class CreatePublicityQaCategories < ActiveRecord::Migration
  def change
    create_table :publicity_qa_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end

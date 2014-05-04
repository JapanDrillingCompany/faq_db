class CreatePublicityHelps < ActiveRecord::Migration
  def change
    create_table :publicity_helps do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

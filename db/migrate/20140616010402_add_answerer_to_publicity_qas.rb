class AddAnswererToPublicityQas < ActiveRecord::Migration
  def change
    add_column :publicity_qas, :answerer, :string
  end
end

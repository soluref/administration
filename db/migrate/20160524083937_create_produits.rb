class CreateProduits < ActiveRecord::Migration
  def change
    create_table :produits do |t|
      t.string :title
      t.float :prix
      t.integer :quantite

      t.timestamps null: false
    end
  end
end

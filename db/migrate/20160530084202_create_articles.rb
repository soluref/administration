class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
		t.string  "intitule", limit: 50, null: false
		t.text    "donnees",             null: false
		t.integer "archive",  limit: 1,  null: false
		t.text    "slider",              null: false
		t.timestamps null: false
		t.belongs_to :page, index: true 
    end
  end
end

class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :artist
      t.text :content

      t.timestamps null: false
    end
  end
end

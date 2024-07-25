class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :full_link
      t.string :token

      t.timestamps
    end
    add_index :links, :token, unique: true
  end
end

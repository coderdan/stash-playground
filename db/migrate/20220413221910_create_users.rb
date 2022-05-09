class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender 
      t.date :dob
      t.timestamps
      t.string :stash_id
    end

    add_index :users, :stash_id
  end
end

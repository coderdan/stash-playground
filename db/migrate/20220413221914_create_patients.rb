class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.references :user
      t.string :height_ciphertext
      t.string :weight_ciphertext
      t.string :health_issues
      t.string :allergies
      t.timestamps
    end
  end
end

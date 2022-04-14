class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.references :user
      t.decimal :height
      t.decimal :weight
      t.string :health_issues
      t.string :allergies
      t.timestamps
    end
  end
end

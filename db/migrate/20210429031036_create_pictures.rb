class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.text :description
      t.integer :family_id
      # t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

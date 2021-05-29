class CreateApiV1Members < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_members do |t|
      t.integer :crew_id
      t.string :image
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end

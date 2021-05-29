class CreateApiV1Absences < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_absences do |t|
      t.integer :admitter_id
      t.string :admitter_note
      t.datetime :confirmed_at
      t.integer :crew_id
      t.date :end_date
      t.string :member_note
      t.datetime :rejected_at
      t.date :start_date
      t.string :absence_type
      t.integer :user_id

      t.timestamps
    end
  end
end

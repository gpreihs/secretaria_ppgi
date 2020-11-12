class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :status
      t.references :activity_type, foreign_key: true

      t.timestamps
    end
  end
end

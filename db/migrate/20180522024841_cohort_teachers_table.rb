class CohortTeachersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :cohort_teachers do |t|
      t.integer :cohort_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end

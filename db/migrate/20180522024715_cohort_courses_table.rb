class CohortCoursesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :cohort_courses do |t|
      t.integer :course_id
      t.integer :cohort_id

      t.timestamps
    end
  end
end

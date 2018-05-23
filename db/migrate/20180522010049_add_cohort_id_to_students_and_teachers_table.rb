class AddCohortIdToStudentsAndTeachersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :cohort_id, :integer
    add_column :teachers, :cohort_id, :integer
  end
end

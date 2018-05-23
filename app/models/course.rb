class Course < ApplicationRecord
  has_many :course_students
  has_many :students, through: :course_students
  has_many :course_teachers
  has_many :teachers, through: :course_teachers
  has_many :cohort_courses
  has_many :cohorts, through: :cohort_courses
end

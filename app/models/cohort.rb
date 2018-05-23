class Cohort < ApplicationRecord
  has_many :cohort_students
  has_many :students, through: :cohort_students
  has_many :cohort_teachers
  has_many :teachers, through: :cohort_teachers
  has_many :cohort_courses
  has_many :courses, through: :cohort_courses
end

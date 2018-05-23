class Student < ApplicationRecord
  # has_one :user
  # belongs_to :cohort
  # has_one :cohort
  has_many :cohort_students
  has_many :cohorts, through: :cohort_students
  has_many :course_students
  has_many :courses, through: :course_students

  def full_name
    "#{first_name} #{last_name}"
  end
end

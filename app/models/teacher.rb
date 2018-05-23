class Teacher < ApplicationRecord
  has_many :cohort_teachers
  has_many :cohorts, through: :cohort_teachers
  has_many :course_teachers
  has_many :courses, through: :course_teachers

  def full_name
    "#{first_name} #{last_name}"
  end
end

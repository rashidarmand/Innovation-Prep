class HomeController < ApplicationController
  def index
    @students = Student.all
    @teachers = Teacher.all
    @courses = Course.all
    @cohorts = Cohort.all
  end
end

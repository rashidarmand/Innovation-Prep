class CohortCoursesController < ApplicationController
  def new
    @student_ids = params[:student_ids]
    puts params[:student_ids]
  end
  
  def edit
    @cohort_courses = CohortCourse.find(params[:id])
  end

  def create
    # debugger
    # @course = Course.find(params[:course_id])
    @cohort_course = CohortCourse.new(cohort_course_params)
        
    respond_to do |format|
      if @cohort_course.save
        format.html { redirect_to courses_path, notice: 'Cohort was successfully added.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { redirect_to courses_path, notice: 'Cohort unable to be added' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
  end

  def destroy
  end

  def cohort_course_params
    params.require(:cohort_course).permit(:cohort_id, :course_id)
  end
end

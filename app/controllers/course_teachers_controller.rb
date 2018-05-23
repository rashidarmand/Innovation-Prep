class CourseTeachersController < ApplicationController
  # caches_page :index, :show  
  # skip_before_action :verify_authenticity_token, :only => [:index, :show]

  def new
    @student_ids = params[:student_ids]
    puts params[:student_ids]
  end
  def edit
    @course_teachers = CourseTeacher.find(params[:id])
  end

  def create
    # debugger
    @course = Course.find(params[:course_id])
    @course_teacher = CourseTeacher.new(course_teacher_params)
        
    respond_to do |format|
      if @course_teacher.save
        format.html { redirect_to @course, notice: 'Teacher was successfully added.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { redirect_to @course, notice: 'Teacher unable to be added' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
  end

  def destroy
  end

  def course_student_params
    params.require(:course_teacher).permit(:course_id, :teacher_id)
  end

end

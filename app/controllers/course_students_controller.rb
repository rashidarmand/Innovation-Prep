class CourseStudentsController < ApplicationController
  # caches_page :index, :show  
  # skip_before_action :verify_authenticity_token, :only => [:index, :show]

  def new
    @student_ids = params[:student_ids]
    puts params[:student_ids]
  end
  def edit
    @course_students = CourseStudent.find(params[:id])
  end

  def create
    # puts params[:student_id]
    # debugger
    # @course = Course.find(params[:course_id])

    @course_student = CourseStudent.new(course_student_params)
        
          respond_to do |format|
            if @course_student.save
              format.html { redirect_to courses_path, notice: 'Student was successfully added.' }
              format.json { render :show, status: :created, location: @course }
            else
              format.html { redirect_to courses_path, notice: 'Student unable to be added' }
              format.json { render json: @course.errors, status: :unprocessable_entity }
            end
          end

        # end
    # end
  end

  def update
  end

  def destroy
  end

  def course_student_params
    params.require(:course_student).permit(:course_id, :student_id)
  end
end

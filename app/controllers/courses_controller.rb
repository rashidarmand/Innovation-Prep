class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @students = Student.all
    @course_student = CourseStudent.new
    @student_ids = params[:student_ids]
    # @course_students = 'course_students/create'
    # student_ids = params[:student_ids]
    # puts params[:student_ids]

  end

  # GET /courses/new
  def new
    @course = Course.new
    @course_student = CourseStudent.new
    @course_teacher = CourseTeacher.new
    
    @students = Student.all
    @student_ids = params[:student_ids]
    # puts params[:student_ids]
  end

  # GET /courses/1/edit
  def edit
    @course_student = CourseStudent.new
    @course_teacher = CourseTeacher.new
    @cohort_course = CohortCourse.new

    @students = Student.where.not(id: @course.course_students.each{|cs| cs.student_id})
    @teachers = Teacher.where.not(id: @course.course_teachers.each{|ct| ct.teacher_id})
    @cohorts = Cohort.where.not(id: @course.cohort_courses.each{|cc| cc.cohort_id})
    # @course = Course.new
    # puts params[:student_id]

    @course_students = CourseStudent.where(course_id: @course.id).map do |course_student|
      course_student.student_id
    end

    @course_teachers = CourseTeacher.where(course_id: @course.id).map do |course_teacher|
      course_teacher.teacher_id
    end


    # if CourseStudent.find_by(course_id: params[:id])
    #   @course_student = CourseStudent.find_by(course_id: params[:id])
    # else
    #   @course_student = CourseStudent.new
    # end

    # if CourseTeacher.find_by(cohort_id: params[:id])
    #   @course_teacher = CourseStudent.find_by(cohort_id: params[:id])
    # else
    #   @course_teacher = CourseStudent.new
    # end

    # @student_ids = params[:student_id]



  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :hours)
    end

end

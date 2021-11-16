class CoursesController < ApplicationController
  before_action :set_course, only: %i[show destroy create set_course_price]
  before_action :set_courses_subjects_prices, only: %i[new edit update create]
  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
    @subject = Subject.find(@course.subject_id)
    @user = @course.tutor
  end

  # GET /courses/new
  def new
    @course = Course.new
    
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_path(current_user.id), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    @course = Course.find(params[:id])
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_path(current_user.id), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: course_path(current_user.id) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find_by(tutor_id: params[:tutor_id])
    end

    def set_courses_subjects_prices
      @courses = Course.all
      @subjects = Subject.all
      @prices = [2000, 3000, 4000]
    end 

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :tutor_id, :subject_id, :description, :price)
    end
end

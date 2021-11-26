class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy students_show]
  before_action :set_roles, only: %i[ new edit create update ]
  before_action :set_subjects, only: %i[ new edit create update]
  before_action :authenticate_user!, except: %i[index]
  # GET /users or /users.json
  def index
    @users = User.all
  end

  def tutors_index
    @users = User.with_role(:tutor)
  end 

  def students_index
    @users = User.with_role(:student)
  end 

  def students_show
    @users = User.with_role(:student)
    @students = []
    @users.each do |student|
      student.studied_courses.each do |course|
        if course.tutor_id == @user.id
          @students << student
        end 
      end
    end 
  end 

  def admin_dashboard
    @students = User.with_role(:student)
    @tutors = User.with_role(:tutor)
  end 

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def set_roles
      @roles = Role.all 
      @signup_roles = Role.where.not(name: "admin")
    end 

    def set_subjects
      @subjects = Subject.all
    end 

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :profile_photo, :about_me, subject_role_ids: [], subject_ids: [])
    end
end

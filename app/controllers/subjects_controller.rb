class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]
  
  def index
    @subjects = Subject.all
  end

  # GET /subject/1 or /subject/1.json shows tutors for specific subject
  def show
    @tutors = User.includes(:taught_courses)
    @users = User.all
  end

 private

  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

   # Only allow a list of trusted parameters through.
  def user_params
    params.require(:subject).permit(:name)
  end
end

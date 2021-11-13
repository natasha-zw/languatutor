class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]
  
  def index
    @subjects = Subject.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @users = User.all
    # @taught_course = @user.taught_courses.find_by(subject_id: params[:id])
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

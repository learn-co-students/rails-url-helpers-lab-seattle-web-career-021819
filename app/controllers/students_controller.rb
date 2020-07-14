class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    if @student.active == true
      @status = "active"
    else
      @status = "inactive"
    end
  end

  def activate
    @student = Student.find(params[:id])
    if @student.active == true
      @student.update_columns(active: false)
    else
      @student.update_columns(active: true)
    end
    @student.save
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end

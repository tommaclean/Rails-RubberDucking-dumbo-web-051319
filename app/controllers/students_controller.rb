class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :delete]


  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    if @student.valid?
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def show

  end

  def edit
  end

  def update
    find_student
    @student.update(student_params)
    redirect_to student_path
  end

  def delete
  end

  def destroy
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
      params.require(:student).permit(:name, :mod)
  end
end

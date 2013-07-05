class StudentsController < ApplicationController

  def index
    @students = Student.order('name ASC').all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])

    if @student.save
      flash[:notice] = 'Student has created.'
      redirect_to students_path
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(params[:student])
      flash[:notice] = "Student #{params[:student][:name]} has successfully updated"
      redirect_to students_path
    else
      render 'edit', :id => @student.id, :flash => flash
    end
  end

end

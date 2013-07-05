class LessonTypesController < ApplicationController

  def index
    @lesson_types = LessonType.order('name ASC').all
  end

  def new
    @lesson_type = LessonType.new
  end

  def edit
    @lesson_type = LessonType.find(params[:id])
  end

  def update
    @lesson_type = LessonType.find(params[:id])

    if @lesson_type.update_attributes(params[:lesson_type])
      flash[:notice] = "Lesson's type has successfully updated"
      redirect_to lesson_types_path
    else
      flash[:errors] = @lesson_type.errors
      render 'edit', :id => @lesson_type.id, :flash => flash
    end
  end

  def create
    @lesson_type = LessonType.new(params[:lesson_type])

    if @lesson_type.save
      flash[:notice] = "Lesson's type has created"
      redirect_to lesson_types_path
    else
      render 'new'
    end
  end

  def destroy
    @lesson_type = LessonType.find(params[:id])
    @lesson_type.destroy

    redirect_to lesson_types_path
  end

end

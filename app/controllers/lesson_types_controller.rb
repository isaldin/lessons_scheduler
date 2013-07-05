class LessonTypesController < ApplicationController

  def index
    @lesson_types = LessonType.all
  end

  def new
    @lesson_type = LessonType.new
    @lesson_type
  end

end

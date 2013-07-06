class LessonsController < ApplicationController

  def index
    @events = Lesson.all.map { |lesson|
      {
          :start => lesson.start,
          :end => lesson.end,
          :title => lesson.student.name,
          :editable => 'true',
          :allDay => false,
          :lesson_id => lesson.id
      }
    }

    respond_to do |format|
      format.json { render json: @events }
    end
  end

  def show
    i = 0
  end

  def new
    @lesson = Lesson.new
    time = DateTime.strptime(params[:start], '%d.%m.%Y %H:%M')
    @lesson.start = time
  end

  def create
    @lesson = Lesson.new(params[:lesson])

    if @lesson.save
      redirect_to root_path
    else
      #
    end
  end

end

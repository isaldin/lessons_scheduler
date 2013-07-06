class Lesson < ActiveRecord::Base
  attr_accessible :student_id, :lesson_type_id, :start, :end

  before_save :init_end

  def student
    Student.find(self.student_id)
  end

  def lesson_type
    LessonType.find(self.lesson_type)
  end

  def init_end
    @lesson = LessonType.find(self.lesson_type_id)
    self.end = self.start + @lesson.duration.minutes
  end
end

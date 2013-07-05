class LessonType < ActiveRecord::Base
  attr_accessible :duration, :name, :price_per_student, :pupils_count
end

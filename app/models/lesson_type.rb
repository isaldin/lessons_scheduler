class LessonType < ActiveRecord::Base
  attr_accessible :duration, :name, :price_per_student, :pupils_count

  validates :name, :presence => true, :uniqueness => true
  validates :pupils_count, :presence => true, :numericality => {:greater_than => 0, :less_than => 999}
  validates :duration, :presence => true, :numericality => {:greater_than => 0, :less_than => 999}
  validates :price_per_student, :presence => true, :numericality => {:greater_than => 0, :less_than => 999}

end
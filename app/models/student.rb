class Student < ActiveRecord::Base
  after_initialize :default_values

  attr_accessible :bill, :contacts, :name, :time_zone

  validates :bill, :presence => true, :numericality => {:greater_than_or_equal_to => 0, :less_than => 9999}
  validates :name, :presence => true, :uniqueness => true

  def default_values
    self.bill = 0
  end

end

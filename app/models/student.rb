class Student < ActiveRecord::Base
  attr_accessible :bill, :contacts, :name, :time_zone
end

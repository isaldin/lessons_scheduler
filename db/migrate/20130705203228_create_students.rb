class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :time_zone
      t.integer :bill
      t.string :contacts

      t.timestamps
    end
  end
end

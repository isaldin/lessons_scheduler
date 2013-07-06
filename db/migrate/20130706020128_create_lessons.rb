class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :lesson_type_id
      t.integer :student_id
      t.timestamp :start
      t.timestamp :end

      t.timestamps
    end
  end
end

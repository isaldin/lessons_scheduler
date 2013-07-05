class CreateLessonTypes < ActiveRecord::Migration
  def change
    create_table :lesson_types do |t|
      t.string :name
      t.integer :pupils_count
      t.integer :duration
      t.integer :price_per_student

      t.timestamps
    end
  end
end

class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :description

      t.timestamps
    end
  end
end

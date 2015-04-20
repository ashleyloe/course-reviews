class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :department
      t.integer :course_number
      t.string :course_title
      t.text :description
      t.decimal :rating, precision: 3, scale: 2

      t.timestamps
    end
  end
end

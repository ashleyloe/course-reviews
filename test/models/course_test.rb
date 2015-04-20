require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  fixtuers :courses
 test "course attributes must not be empty" do
    course = Course.new
    assert course.invalid?
    assert course.errors[:department].any?
    assert course.errors[:course_number].any?
    assert course.errors[:course_title].any?
    assert course.errors[:description].any?
    assert course.errors[:rating].any?
  end

  test "course rating must be positive" do
    course = Course.new(department:       "CSC",
    						course_number: 123,
                          course_title: "yyy",
                          description:   "zzz")
    course.rating = -1
    assert course.invalid?
    assert_equal ["must be greater than or equal to 0.0"],
      course.errors[:rating]

    course.rating = 6
    assert course.invalid?
    assert_equal ["must be less than or equal to 5.0"], 
      course.errors[:rating]

    course.rating = 1
    assert course.valid?
  end

  test "course number must be positive" do
    course = Course.new(department:       "CSC",
                          course_title: "yyy",
                          description:   "zzz",
                          rating: 5.0)
    course.course_number = 50
    assert course.invalid?
    assert_equal ["must be greater than or equal to 100"],
      course.errors[:course_number]

    course.course_number = 600
    assert course.invalid?
    assert_equal ["must be less than or equal to 400"], 
      course.errors[:course_number]

    course.course_number = 102
    assert course.valid?
  end

 

  test "course is not valid without a unique title" do
    course = Course.new(department:       courses(:ruby).department,
                          course_title: 330,
                          course_title: "hi",
                          description: "description",
                          rating:       1)

    assert course.invalid?
    assert_equal ["must be length 3"], course.errors[:department]
  end

  
end

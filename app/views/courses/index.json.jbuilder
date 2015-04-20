json.array!(@courses) do |course|
  json.extract! course, :id, :department, :course_number, :course_title, :description, :rating
  json.url course_url(course, format: :json)
end

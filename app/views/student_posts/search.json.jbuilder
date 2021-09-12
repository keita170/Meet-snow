json.array! @student_post do |student|

  json.body student.body
  json.title student.title
end
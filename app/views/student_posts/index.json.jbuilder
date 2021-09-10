json.array! @student_posts do |student|

  json.body student.body
  json.title student.title
  json.field student.field
  json.status student.status
  
end
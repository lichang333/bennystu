def wagon_sort(students)
  students.sort_by! do |alpha|
    alpha.downcase
  end
  # for student in students
  #   student.downcase!
  #   student.capitalize!
  # end

  return students
end

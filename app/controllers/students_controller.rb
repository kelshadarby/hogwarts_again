class StudentsController < ApplicationController
  def index
    students = Student.all
    @sorted_students = students.sort_by { |student| student.name }
  end
end

class ProfessorsController < ApplicationController
  def index
    professors = Professor.all
    @sorted_professors = professors.sort_by { |professor| professor.name }
  end

  def show
    @professor = Professor.find(params[:id])
    student_ages = @professor.students.map do |student|
      student.age.to_f
    end
    total_ages = student_ages.sum
    @average_student_age = total_ages/student_ages.length
  end
end

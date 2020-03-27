require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the students index page and see all students and the number of professors they have" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

    visit "/students"

    within "#student-#{harry.id}" do
      expect(page).to have_content("#{harry.name}: 3")
      expect(page).to_not have_content(harry.age)
      expect(page).to_not have_content(harry.house)
    end
    within "#student-#{malfoy.id}" do
      expect(page).to have_content("#{longbottom.name}: 2")
      expect(page).to_not have_content(malfoy.age)
      expect(page).to_not have_content(malfoy.house)
    end
    within "#student-#{longbottom.id}" do
      expect(page).to have_content("#{longbottom.name}: 1")
      expect(page).to_not have_content(longbottom.age)
      expect(page).to_not have_content(longbottom.house)
    end
  end
end

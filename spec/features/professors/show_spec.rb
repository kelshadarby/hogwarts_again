require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the professors index page and see al professors with their name, age and specialty" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student: harry, professor: snape)
    ProfessorStudent.create(student: longbottom, professor: snape)
    ProfessorStudent.create(student: malfoy, professor: lupin)

    visit "/professors/#{snape.id}"

    within '.student-names-list' do
      within "#student-#{harry.id}" do
        expect(page).to have_content(snape.name)
        expect(page).to_not have_content(snape.age)
        expect(page).to_not have_content(snape.house)
      end
      within "#student-#{longbottom.id}" do
        expect(page).to have_content(longobttom.name)
        expect(page).to_not have_content(longobttom.age)
        expect(page).to_not have_content(longobttom.house)
      end
    end
  end
end

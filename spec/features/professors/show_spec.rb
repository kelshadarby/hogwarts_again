require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the professors show page and see each students name" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student: harry, professor: snape)
    ProfessorStudent.create(student: longbottom, professor: snape)

    visit "/professors/#{snape.id}"

    within '.student-names-list' do
      within "#student-#{harry.id}" do
        expect(page).to have_content(harry.name)
        expect(page).to_not have_content(harry.age)
        expect(page).to_not have_content(harry.house)
      end
      within "#student-#{longbottom.id}" do
        expect(page).to have_content(longbottom.name)
        expect(page).to_not have_content(longbottom.age)
        expect(page).to_not have_content(longbottom.house)
      end
    end
  end
end

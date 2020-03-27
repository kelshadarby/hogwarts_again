require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the professors index page and see al professors with their name, age and specialty" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit "/professors"

    within "#song-#{snape.id}" do
      expect(page).to have_content("Name: #{snape.name}")
      expect(page).to have_content("Age: #{snape.age}")
      expect(page).to have_content("Specialty: #{snape.specialty}")
    end
    within "#song-#{hagrid.id}" do
      expect(page).to have_content("Name: #{hagrid.name}")
      expect(page).to have_content("Age: #{hagrid.age}")
      expect(page).to have_content("Specialty: #{hagrid.specialty}")
    end
    within "#song-#{lupin.id}" do
      expect(page).to have_content("Name: #{lupin.name}")
      expect(page).to have_content("Age: #{lupin.age}")
      expect(page).to have_content("Specialty: #{lupin.specialty}")
    end
  end
end

require './lib/bnb'
require 'pg'

RSpec.describe Bnb do
  describe ".all" do
    it "can view all records" do

      place = Bnb.create(place: "London", user_name:"george", description: "Good", fixed_price: "20")
      Bnb.create(place: "Berlin", user_name:"george", description: "Okay", fixed_price: "25")
      Bnb.create(place: "Casablanca", user_name:"george", description: "Good", fixed_price: "100")


      places = Bnb.all
      p places

      expect(places.length).to eq 3
      expect(places.first).to be_a Bnb
      expect(places.first.id).to eq place.id
      expect(places.first.user_name).to eq 'george'
      expect(places.first.place).to eq 'London'
    end
  end

  describe ".create" do
    it "Add a new place to stay§" do
      place = Bnb.create(user_name: 'Bob', place: 'Casa Amor', description: 'The House of love, for wrinkly old people with too much money', fixed_price: '999', date_from: "2020-05-27", date_to: "2020-05-28")

      expect(place).to be_a Bnb
      expect(place.place).to eq 'Casa Amor'
      expect(place.description).to eq 'The House of love, for wrinkly old people with too much money'
      expect(place.fixed_price).to eq '999'
      expect(place.date_from).to eq "2020-05-27"
      expect(place.date_to).to eq "2020-05-28"
    end
  end
end

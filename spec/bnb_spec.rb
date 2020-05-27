require './lib/bnb'
require 'pg'

RSpec.describe Bnb do
  describe ".all" do
    it "can view all records" do
      result = DatabaseConnection.query("INSERT INTO main (user_name, place) VALUES('george', 'London') RETURNING id, user_name, place;")
      place = Bnb.new(id: result[0]['id'], user_name: result[0]['user_name'], place: result[0]['place'])
      DatabaseConnection.query("INSERT INTO main (user_name, place) VALUES('glen', 'Paris');")
      DatabaseConnection.query("INSERT INTO main (user_name, place) VALUES('anna', 'Berlin');")

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
      place = Bnb.create(place: 'Casa Amor', description: 'The House of love, for wrinkly old people with too much money")', fixed_price: '999')

      expect(place).to be_a Bnb
      expect(place.place).to eq 'Casa Amor'
      expect(place.description).to eq 'The House of love, for wrinkly old people with too much money'
      expect(place.fixed_price).to eq '999'
    end
  end
end

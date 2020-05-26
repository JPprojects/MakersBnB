require 'pg'

class Bnb
  attr_reader :place

  def initialize( place: )
      @place = place


  end


  def self.all
    result = DatabaseConnection.query("SELECT * FROM main ;")
    result.map do |main|
        Bnb.new(place: main['place'])
    end
  end

  # def self.create(name:)
  #   result = DatabaseConnection.query("INSERT INTO main (user_name) VALUES('#{name}') RETURNING user_name, place")
  #   Bnb.new(name: result[0]['user_name'], place: result[0]['place'] ) 
  # end 


end

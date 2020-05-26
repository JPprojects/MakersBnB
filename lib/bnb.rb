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
end

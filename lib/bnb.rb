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

  def self.reserve(id:, place:, reservation_status:)
    result = DatabaseConnection.query("UPDATE main SET reservation_status = 'reserved' WHERE id = #{id};")
   Bnb.new(id: result[0]['id'], place: result[0]['place'], reservation_status: result[0]['reservation_status'])
end

end

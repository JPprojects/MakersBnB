require 'pg'

class Bnb
  attr_reader :place , :id , :reservation_status

  def initialize( place:, id:, reservation_status: )
    @place = place
    @id = id
    @reservation_status = reservation_status
  end


  def self.all
    result = DatabaseConnection.query("SELECT * FROM main ;")
    result.map do |main|
      Bnb.new(id: main['id'], place: main['place'], reservation_status: main['reservation_status'])
    end
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM main WHERE id = #{id};")
    Bnb.new(id: result[0]['id'], place: result[0]['place'], reservation_status: result[0]['reservation_status'])
  end

  def self.reserve(id:, place:, reservation_status:)
    result = DatabaseConnection.query("UPDATE main SET reservation_status = 'reserved' WHERE id = #{id} RETURNING id, place, reservation_status;")
   Bnb.new(id: result[0]['id'], place: result[0]['place'], reservation_status: result[0]['reservation_status'])
end
end

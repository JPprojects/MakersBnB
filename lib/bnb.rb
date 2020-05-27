require 'pg'

class Bnb
  attr_reader :place, :id, :user_name, :description, :fixed_price, :reservation_status, :date_to, :date_from

  def initialize( id:, place:, user_name:, description:, fixed_price:, reservation_status:, date_from:, date_to:)
    @place = place
    @id = id
    @user_name = user_name
    @description = description
    @fixed_price = fixed_price
    @reservation_status = reservation_status
    @date_to = date_to
    @date_from = date_from
  end


  def self.all
    result = DatabaseConnection.query("SELECT * FROM main ;")
    result.map do |main|
      Bnb.new( id: main['id'], place: main['place'], user_name: main['user_name'], description: main['description'], fixed_price: main['fixed_price'], reservation_status: main['reservation_status'], date_from: main['date_from'], date_to: main['date_to'])
    end
  end

  def self.create(user_name:, place:, description:, fixed_price:, date_from:, date_to:)
    result = DatabaseConnection.query("INSERT INTO main (user_name, place, description, fixed_price, date_from, date_to) VALUES('#{user_name}', '#{place}', '#{description}', '#{fixed_price}', '#{date_from}', '#{date_to}' 
    RETURNING id, user_name, place, description, fixed_price, reservation_status, date_from, date_to")
    Bnb.new(id: result[0]['id'], user_name: result[0]['user_name'], place: result[0]['place'],  description: result[0]['description'], fixed_price: result[0]['fixed_price'], reservation_status: result[0]['reservation_status'], date_from: result[0]['date_from'], date_to: result[0]['date_to'])
  end

def self.find(id:)
  result = DatabaseConnection.query("SELECT * FROM main WHERE id = #{id};")
  Bnb.new(id: result[0]['id'], user_name: result[0]['user_name'], place: result[0]['place'],  description: result[0]['description'], fixed_price: result[0]['fixed_price'], reservation_status: result[0]['reservation_status'] )
end

  def self.reserve(id:, place:, reservation_status:)
    result = DatabaseConnection.query("UPDATE main SET reservation_status = 'reserved' WHERE id = #{id} RETURNING id, place, reservation_status;")
   Bnb.new(id: result[0]['id'], user_name: result[0]['user_name'], place: result[0]['place'], description: result[0]['description'], fixed_price: result[0]['fixed_price'], reservation_status: result[0]['reservation_status'])
end
end

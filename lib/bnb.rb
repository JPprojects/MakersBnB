require 'pg'

class Bnb
  attr_reader :place, :id, :user_name, :description, :fixed_price

  def initialize( id:, place:, user_name:, description:, fixed_price:)
    @place = place
    @id = id
    @user_name = user_name
    @description = description
    @fixed_price = fixed_price

  end


  def self.all
    result = DatabaseConnection.query("SELECT * FROM main ;")
    result.map do |main|
        Bnb.new( id: main['id'], place: main['place'], user_name: main['user_name'], description: main['description'], fixed_price: main['fixed_price'] )
    end
  end

  def self.create(user_name:, place:, description:, fixed_price:)
    result = DatabaseConnection.query("INSERT INTO main (user_name, place, description, fixed_price ) VALUES('#{user_name}', '#{place}', '#{description}', '#{fixed_price}') RETURNING id, user_name, place, description, fixed_price")
    Bnb.new(id: result[0]['id'], user_name: result[0]['user_name'], place: result[0]['place'],  description: result[0]['description'], fixed_price: result[0]['fixed_price'] )
  end


end

require 'pg'

class Bnb
  attr_reader :place, :id, :user_name

  def initialize( id:, place:, user_name: )
      @place = place
      @id = id
      @user_name = user_name
  end


  def self.all
    result = DatabaseConnection.query("SELECT * FROM main ;")
    result.map do |main|
        Bnb.new(id: main['id'], place: main['place'], user_name: main['user_name'])
    end
  end

  def self.create(name:)
    result = DatabaseConnection.query("INSERT INTO main (user_name) VALUES('#{name}') RETURNING user_name, place")
    Bnb.new(name: result[0]['user_name'], place: result[0]['place'] )
  end


end

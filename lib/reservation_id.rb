require 'pg'
class ReservationId
  def self.randomize
    rand.to_s[2..10]
  end
end

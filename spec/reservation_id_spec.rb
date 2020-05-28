require 'pg'
require './lib/reservation_id.rb'

describe 'random id generation' do
  it 'generates a random reservation id' do
    id = ReservationId.randomize
    expect(id.length).to eq 9
  end
end

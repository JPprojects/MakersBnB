require './lib/database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'Makers_BnB_test')

      DatabaseConnection.setup('Makers_BnB_test')
    end
  end

  it 'this connection is persistent' do
    # Grab the connection as a return value from the .setup method
    connection = DatabaseConnection.setup('Makers_BnB_test')
  
    expect(DatabaseConnection.connection).to eq connection
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('Makers_BnB_test')
  
      expect(connection).to receive(:exec).with("SELECT * FROM main;")
  
      DatabaseConnection.query("SELECT * FROM main;")
    end
  end
end
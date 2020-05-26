require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('Makers_BnB_test')
  else
    DatabaseConnection.setup('Makers_BnB')
end
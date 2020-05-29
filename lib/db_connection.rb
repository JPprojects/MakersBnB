require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('Makers_BnB_test')
elsif ENV['ENVIRONMENT'] == 'production'
  DatabaseConnection.setup('d78lc77l11dgnj')
else 
  DatabaseConnection.setup('Makers_BnB')
end
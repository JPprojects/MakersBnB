require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'Makers_BnB_test')
  connection.exec("TRUNCATE main;")
end

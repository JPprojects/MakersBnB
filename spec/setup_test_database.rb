require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'Makers_BnB_test')
  connection.exec("TRUNCATE main;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'Makers_BnB_test')
  DatabaseConnection.query("INSERT INTO main (user_name, place) VALUES('George', 'London');")
end


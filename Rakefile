require 'pg'

task :setup do
  connection = PG.connect
  connection.exec('CREATE DATABASE "Makers_BnB";')

  connection = PG.connect :dbname => 'Makers_BnB';
  connection.exec('CREATE TABLE main (id SERIAL PRIMARY KEY, user_name VARCHAR(60), place VARCHAR(100), fixed_price VARCHAR(5), reservation_status VARCHAR(60), date_from DATE, date_to DATE);')
end

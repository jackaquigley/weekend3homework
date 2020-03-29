DROP TABLE if EXISTS cinema;

CREATE TABLE cinema (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

DROP TABLE if EXISTS customers;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  cash INT
);

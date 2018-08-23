DROP DATABASE IF EXISTS bamazon_DB;

CREATE DATABASE bamazon_DB;

USE bamazon_DB;

CREATE TABLE products(
  item_id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(100) NOT NULL,
  department_name VARCHAR(45) NOT NULL,
  price DECIMAL(10,2) NULL,
  stock_quantity INT NULL,
  PRIMARY KEY (item_id)  
);


INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Rainbow Brite", "Video", 15, 12); 

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Cabbage Patch Kid", "Toys", 30, 5); 

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Care Bear", "Toys", 33, 1); 

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Popple", "Toys", 45, 3); 

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Easy Bake Oven", "Toys", 59, 2); 

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Nintendo", "Games", 70, 1); 

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("The Dark Crystal", "Video", 5, 6); 

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Jem", "Video", 5, 4); 

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Operation", "Games", 12, 1); 

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Guess Who?", "Games", 15, 2); 


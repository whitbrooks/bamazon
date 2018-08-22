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
VALUES ("Rainbow Brite", VHS, 15, 12), ("Cabbage Patch Kid", dolls, 30, 5), ("Care Bear", stuffed animals, 33, 1), ("Popple", stuffed animals, 45, 3), ("Easy Bake Oven", toys, 59, 2), ("Nintendo", games, 70, 1), ("The Dark Crystal", VHS, 5, 6);
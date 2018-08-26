var mysql = require("mysql");
require("console.table");
var inquirer = require("inquirer");


// create the connection information for the sql database
var connection = mysql.createConnection({
    host: "localhost",
  
    // Your port; if not 3306
    port: 3306,
  
    // Your username
    user: "root",
  
    // Your password
    password: "root",
    database: "bamazon_DB"
  });


// connect to the mysql server and sql database
connection.connect(function(err) {
    if (err) throw err;
    // run the start function after the connection is made to prompt the user
    inventory();
  });
  

// Print inventory and store array of products
function inventory() {
    console.log("Welcome! Here's our inventory:\n");
    connection.query("SELECT * FROM products", function(err, res) {
    if (err) throw err;
    // Log all results of the SELECT statement
    console.table(res);
    // start order process
    custOrder();
    });
}

// prompt user to select item for purchase
function custOrder() {
    inquirer.prompt([
    {
        name: "id",
        type: "input",
        message: "Please input the ID of the product you would like to purchase.",
       
    },
    {
        name: "quantity",
        type: "input",
        message: "How many of this item would you like to purchase?",
        validate: function(val) {
            return (!isNaN(val) && val > 0);
            }
    }
    ])
    .then(function(answers) {
        getPrice(answers.id, answers.quantity);
        });
}  
    
// if product inventory is >= request quantity, tell user cost of their purchase. If quantity is too low, allow user to order again.

function getPrice(id, quantity) {
    connection.query("SELECT * FROM products WHERE item_id = " + id, function(err, res) {
        if (err) throw err;
        var stock_quantity = res[0].stock_quantity;
        var price = res[0].price;
        if (stock_quantity >= quantity) {
        var cost = price * quantity;
        console.log("\nYour total is $" + cost + ". Thanks for your purchase.\n");
        updateInventory(id, quantity, stock_quantity);
        } else {
        console.log("\nWe only have " + stock_quantity + " of your chosen item in stock. Please make another order.\n");
        custOrder();
        }
    });
    }

// update inventory
function updateInventory(id, quantity, stock_quantity) {
    updatedQuantity = stock_quantity -= quantity
    connection.query("UPDATE products SET stock_quantity =" + updatedQuantity + " WHERE item_id = " + id, function(err, res) {
        if (err) throw err;
        custOrder();
        connection.end();
    });
}

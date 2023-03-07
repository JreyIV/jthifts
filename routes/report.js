var express = require('express');
var router = express.Router();

/* Report menu */
router.get('/', function(req, res, next) {
  res.render('reports/reportmenu');
});

// ==================================================
// Route to list all customers
// URL = http://localhost:3026/report/customer/
// ==================================================
router.get('/customer', function(req, res, next) {
    let query = "SELECT customer_id, firstname, lastname, email, phone, city, state FROM customer";
    // execute query
    db.query(query, (err, result) => {
        if (err) {
            console.log(err);
            res.render('error');
        }
        res.render('reports/allcusts', {allrecs: result });
    });
});


// ==================================================
// Route to list all products
// URL = http://localhost:3026/report/products/
// ==================================================
router.get('/products', function(req, res, next) {
    let query = "SELECT product_id, product_type, product_size, product_material, product_condition, product_brand, product_price FROM product";
    // execute query
    db.query(query, (err, result) => {
        if (err) {
            console.log(err);
            res.render('error');
        }
        res.render('reports/allprods', {allrecs: result });
    });
});

// ==================================================
// Route to list all records. Display view to list all records
// URL = http://localhost:3026/review/
// ==================================================
router.get('/sales', function(req, res, next) {
    let query = "SELECT order_id, customer_id, saledate, customernotes, paymentstatus, authorizationnum FROM saleorder";
    // execute query
    db.query(query, (err, result) => {
        if (err) {
            console.log(err);
            res.render('error');
        }
        res.render('reports/allsales', {allrecs: result });
    });
});

module.exports = router;

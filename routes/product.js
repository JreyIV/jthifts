var express = require('express');
var router = express.Router();
// ==================================================
// Route to list all records. Display view to list all records
// URL = http://localhost:3026/product/
// ==================================================
router.get('/', function(req, res, next) {
    let query = "SELECT product_id, product_type, product_size, product_material, product_condition, product_brand, product_price, homepage FROM product";
    // execute query
    db.query(query, (err, result) => {
        if (err) {
            console.log(err);
            res.render('error');
        }
        res.render('product/allrecords', {allrecs: result });
    });
});

// ==================================================
// Route to view one specific record. Notice the view is one record
// URL: http://localhost:3026/customer/1/show
// ==================================================
router.get('/:recordid/show', function(req, res, next) {
    let query = "SELECT product_id, product_type, product_size, product_material, product_condition, product_brand, product_price, homepage FROM product WHERE product_id = " + req.params.recordid;
    // execute query
    db.query(query, (err, result) => {
        if (err) {
            console.log(err);
            res.render('error');
        } else {
            res.render('product/onerec', {onerec: result[0] });
        }
    });
});


// ==================================================
// Route to show empty form to obtain input form end-user.
// URL: http://localhost:3026/customer/addrecord
// ==================================================
router.get('/addrecord', function(req, res, next) {
    res.render('product/addrec');
    });


// ==================================================
// Route to obtain user input and save in database.
// ==================================================
router.post('/', function(req, res, next) {
    let insertquery = "INSERT INTO product (product_type, product_size, product_material, product_condition, product_brand, product_price, homepage) VALUES (?, ?, ?, ?, ?, ?, ?)";

    var homepage_value=0;
    if (req.body.homepage)
        {
            homepage_value = 1;
        }


    db.query(insertquery,[req.body.product_type, req.body.product_size,
    req.body.product_material, req.body.product_condition, req.body.product_brand, req.body.product_price, homepage_value],(err, result) => {
        if (err) {
            console.log(err);
            res.render('error');
        } else {
            res.redirect( '/product');
        }
    });
});


// ==================================================
// Route to edit one specific record.
// URL: http://localhost:3026/customer/99/edit
// ==================================================
router.get('/:recordid/edit', function(req, res, next) {
    let query = "SELECT product_id, product_type, product_size, product_material, product_condition, product_brand, product_price, homepage FROM product WHERE product_id = " + req.params.recordid;
    // execute query
    db.query(query, (err, result) => {
        if (err) {
            console.log(err);
            res.render('error');
        } else {
        res.render('product/editrec', {onerec: result[0] });
        }
    });
});

// ==================================================
// Route to save edited data in database.
// ==================================================
router.post('/save', function(req, res, next) {
    let updatequery = "UPDATE product SET product_id = ?, product_type = ?, product_size = ?, product_material = ?, product_condition = ?, product_brand = ?, product_price = ?, homepage = ? WHERE product_id = " + req.body.product_id;

    var homepage_value=0;
    if (req.body.homepage)
        {
            homepage_value = 1;
        }

    db.query(updatequery,[req.body.product_id, req.body.product_type, req.body.product_size,
    req.body.product_material, req.body.product_condition, req.body.product_brand, req.body.product_price, homepage_value],(err, result) => {
        if (err) {
            console.log(err);
            res.render('error');
        } else {
        res.redirect('/product');
    }
    });
});


// ==================================================
// Route to delete one specific record.
// ==================================================
router.get('/:recordid/delete', function(req, res, next) {
    let query = "DELETE FROM product WHERE product_id = " + req.params.recordid;
    // execute query
    db.query(query, (err, result) => {
        if (err) {
            console.log(err);
            res.render('error');
        } else {
            res.redirect('/product');
        }
    });
});

module.exports = router;  
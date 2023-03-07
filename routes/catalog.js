var express = require('express');
var router = express.Router();
// ==================================================
// Route to list all products on the catalog
// ==================================================
router.get('/', function(req, res, next) {
    let query = "SELECT product_id, product_type, product_size, product_material, product_condition, product_brand, product_price, homepage FROM product";

    // execute query
    db.query(query, (err, result) => {
    if (err) {
        res.redirect('/');
    }
    res.render('catalog', {allrecs: result });
    });
});

module.exports = router;
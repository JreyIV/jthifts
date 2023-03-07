var express = require('express');
var router = express.Router();
// ==================================================
// Route to view one specific record. Notice the view is one record
// http://localhost:3026/search?searchcriteria=
// ==================================================
router.get('/', function(req, res, next) {
    let query = "SELECT product_id, product_type, product_size, product_material, product_condition, product_brand, product_price FROM product WHERE product_type LIKE '%" + req.query.searchcriteria + "%'";

    console.log("Query: " + query );
    // execute query
    db.query(query, (err, result) => {
        if (err) {
            console.log(err);
            res.render('error');
        } else {
            res.render('search', {allrecs: result});
        }
    });
});

module.exports = router;
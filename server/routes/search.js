const express = require('express');
const searchRouter = express.Router();
const auth = require('../middlewares/auth');
const Product = require('../models/product');

searchRouter.get('/api/products/search:productName', auth, async (req, res) => {
    try {
         //We query the category in Product
        console.log(req.params.productName);

        const productQuery = await Product.find({
            productName: {$regex:  req.params.productName, $options: "i" }
        });

        res.json(productQuery);
    } catch (e) {
        console.error(e.message);
        res.status(500).json({error: e.message}); 
    }
});

module.exports = searchRouter;
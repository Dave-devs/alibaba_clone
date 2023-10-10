const express = require('express');
const productRouter = express.Router();
const auth = require('../middlewares/auth');
const Product = require('../models/product');


//How url will be something like this {'/api/products?category=${category}'}
/**
 * Note: We will use query to get each category product the user want to get,
 * be it Fashion, Beauty etc.
 * Since we want to display products base on each category selected bybthe user.
 */
productRouter.get('/api/products', auth, async (req, res) => {
    try {
        //We query the category in Product
       console.log(req.query.category);
       const products = await Product.find({category: req.query.category});

       //We return it to te user
       res.json(products);
    } catch (e) {
        console.error(e.message);
        res.status(500).json({error: e.message});
    }
});


//SERVER REQUEST TO ADD & DELETE A RATING OF A PRODUCT
productRouter.post('/api/rate-product', auth, async (req, res) => {
    try {
        const {id, rating} = req.body;

        const product = await Product.findById(id);

        //We loop through all ratings in product, if userId rating already exist we splic(remove) it from ratings list
        for (let i = 0; i < product.ratings.length; i++) {
            if(product.ratings[i].userId === req.user) {
                product.ratings.splice(i, 1);
                break;
            }   
        }

        const ratingSchema = {
            userId: req.user,
            rating,
        };

        product.ratings.push(ratingSchema);
        product = await product.save();

        res.json({product})


    } catch (e) {
        console.error(e.message);
        res.status(500).json({error: e.message});
    }
})

module.exports = productRouter;
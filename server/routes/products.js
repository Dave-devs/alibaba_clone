const express = require('express');
const productRouter = express.Router();
const auth = require('../middlewares/auth');
const {Product} = require('../models/product');


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
});

//SERVER REQUEST TO GET DEAL OF THE DAY
productRouter.get('/api/deal-of-the-day', auth, async (req, res) => {
    try {
        //Get all products
        let products = await Product.find({});

        products = products.sort((a, b) => {
            let aSum = 0;
            let bSum = 0;

            //We loop through all element of ratings in a products ascendingly
            for (let i = 0; i < a.ratings.length; i++) {
                //Assign the value at index 0 to aSum
                aSum += a.ratings[i].rating;
            };

            //We loop through all element of ratings in a products descendingly
            for (let i = 0; i < b.ratings.length; i++) {
                //Assign the value at index 0 to bSum
                bSum += b.ratings[i].rating;
            };

            /**Note: For example if aSum is 10 at index 0 and bSum is 50 at index 0.
             * In the return statement below, we check if aSum is less than bSum,
             * we return 1 else we return -1(negative 1);
             * we could have done it like this
             * (result = aSum - bSum) and return result;
             */

            //Condition which it will sort
            return aSum < bSum ? 1 : -1;
        });

        res.json(products[0]);

        
    } catch (e) {
        console.error(e.message);
        res.status(500).json({error: e.message});
    }
});

module.exports = productRouter;
const express = require('express');
const adminRouter = express.Router();
const Product = require('../models/product');
const admin = require('../middlewares/admin');

//ADD PRODUCT SERVER REQUEST
adminRouter.post('/admin/add-product', admin, async (req, res) => {
    try {
       const {productName, description, category, quantity, price, images} = req.body;
       
       let product = new Product({
            productName,
            description,
            category,
            quantity,
            price,
            images,
       });

       product = await product.save();

       res.json(product);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({error: error.message});
    }
})

//GET PRODUCTS SERVER REQUEST
adminRouter.get('/admin/get-product', admin, async (req, res) => {
    try {
        const products = await Product.find({});

        res.json(products);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({error: error.message});
    }
})

//DELETE PRODUCT SERVER REQUEST
adminRouter.post('/admin/delete-product', admin, async (req, res) => {
    try {
        const {id} = req.body;

        const product = await Product.findByIdAndDelete(id);

        res.json(product);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({error: error.message});
    }
})

module.exports = adminRouter;
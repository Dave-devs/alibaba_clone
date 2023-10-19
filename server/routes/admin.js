const express = require('express');
const adminRouter = express.Router();
const Product = require('../models/product');
const admin = require('../middlewares/admin');
const Order = require('../models/order');

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
});

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
});

//GET ORDERS SERVER REQUEST
adminRouter.get('/admin/get-orders', admin, async (req, res) => {
    try {
        const orders = await Order.find({});

        res.json(orders);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({error: error.message});
    }
});

//SERVER REQUEST TO CHANGE ORDER STATUS
adminRouter.post('/admin/change-order-status', admin, async (req, res) => {
    try {
        const { id, status } = req.body;

        let order = await Order.findById(id);
        order.status = status;
        order = await order.save();
        
        res.json(order);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({error: error.message});
    }
});

//SERVER REQUEST TO GET TOTAL-EARNINGS 
adminRouter.get('/admin/analytics', admin, async (req, res) => {
    try {
        const orders = await Order.find();
        let totalEarnings = 0;

        /**
        * Note: We loop through Order at index. Since products is an Array we loop through it 
        * too and take quantity. Then we loop through product in products to get the price, 
        * we then mutiply it together and assign it to totalEarnings variable.
        */
        for (let i = 0; i < orders.length; i++) {
           for (let j = 0; j < orders[i].products.length; j++) {
                //Multiply the Product Quantity with Product Price
                totalEarnings += orders[i].products[j].quantity * orders[i].products[j].product.price;
           }
        }
        //CATEGORY WISE ORDER FETCHING => THEY ARE 7
        let fashionEarnings = await fetchCategoryWiseProduct("Fashion & Wears");
        let phonesEarnings = await fetchCategoryWiseProduct("Phones & Telecommunication");
        let beautyEarnings = await fetchCategoryWiseProduct("Beauty, Health & Hair");
        let computerEarnings = await fetchCategoryWiseProduct("Computer, Office & Security");
        let jewelryEarnings = await fetchCategoryWiseProduct("Jewelry & Watches");
        let petsEarnings = await fetchCategoryWiseProduct("Home, Pets & Appliances");
        let bagsEarnings = await fetchCategoryWiseProduct("Bags & Shoes");

        //Create object of all earnings
        let earnings = {
            totalEarnings,
            fashionEarnings,
            phonesEarnings,
            beautyEarnings,
            computerEarnings,
            jewelryEarnings,
            petsEarnings,
            bagsEarnings
        }

        res.json(earnings);

    } catch (error) {
        console.log(error.message);
        res.status(500).json({error: error.message});
    }
});

//We do the same logic in above code here too to find category
async function fetchCategoryWiseProduct(category) {
    let earnings = 0;

    let categoryOrders = await Order.find({
        //This is like looping too
        'products.product.category': category
    });

    for (let i = 0; i < categoryOrders.length; i++) {
        for (let j = 0; j < categoryOrders[i].products.length; j++) {
            //Multiply the Product Quantity with Product Price
            earnings += categoryOrders[i].products[j].quantity * categoryOrders[i].products[j].product.price;
        }
    }

    return earnings;
}

module.exports = adminRouter;
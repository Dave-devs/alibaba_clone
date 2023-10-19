const express = require('express');
const userRouter = express.Router();
const auth = require('../middlewares/auth');
const {Product} = require('../models/product');
const User = require('../models/user');

//SERVER REQUEST TO ADD ITEM TO CART
userRouter.post('/api/add-to-cart', auth, async (req, res) => {
  try {
    const {id} = req.body;
    //We find both Product and User by id supplied;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);

    //We check if length of cart is 0, then we push(add) item to the cart
    if (user.cart.length == 0) {
        user.cart.push({product, quantity: 1});
    } else {
        /**Note: We loop throught all products and check if the particular product (Product find by id) 
         * above is already in User's cart. If it's there we increase te quantity by 1 else we add for first time
        */
        let productFound = false;
        for (let i = 0; i < user.cart.length; i++) {
           if(user.cart[i].product._id.equals(product._id)) {
                productFound = true;
           }
        }
        /**Note: We check if product is found in user's cart and check if it's equals to added product we pudhed above by id.
         * Then we increase cart quantity item by 1 we push the product in it.
        */
        if(productFound) {
            let producttt = user.cart.find((productt) => 
                productt.product._id.equals(product._id)
            );
            producttt.quantity += 1;
        } else {
            user.cart.push({ product, quantity: 1});
        }
    }

    user = await user.save();
    res.json(user);

  } catch (e) {
    console.error(e.message);
    res.status(500).json({error: e.message});
  }
});

//SERVER REQUEST TO SAVE REMOVE ITEM FROM CART
//www.localhost:3000/api/remove-from-cart/:id
userRouter.delete('/api/remove-from-cart/:id', auth, async (req, res) => {
  try {
    const {id} = req.params;
    //We find both Product and User by id supplied;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);

    //Loop through all item in user's cart
    for (let i = 0; i < user.cart.length; i++) {
        if(user.cart[i].product._id.equals(product._id)) {
          if(user.cart[i].quantity === 1) {
            user.cart.splice(i, 1);
          } else {
            user.cart[i].quantity -= 1;
          }
        }
            
    }

    user = await user.save();
    res.json(user);

  } catch (e) {
    console.error(e.message);
    res.status(500).json({error: e.message});
  }
});

//SERVER REQUEST TO SAVE USER ADDRESS
userRouter.post('/api/store-user-address', auth, async (req, res) => {
  try {
    const {address} = req.body;

    let user = await User.findById(req.user);
    user.address = address;
    user = await user.save();

    res.json(user);
  } catch (e) {
    console.error(e.message);
    res.status(500).json({error: e.message});
  }
});

//SERVER REQUEST TO ORDER PRODUCT
userRouter.post('/api/oder', auth, async (req, res) => {
  try {
    const {cart, totolPrice, address} = req.body;
    let products = [];

    for (let i = 0; i < cart.length; i++) {
      let product = await Product.findById(cart[i].product._id);
      if(product.quantity >= cart[i].quantity) {
        product.quantity -= cart[i].quantity;
        products.push({product, quantity: cart[i].quantity});
        await product.save();
      } else {
        return res.status(400).json({msg: `${product.name} is out of stock!`});
      }
    }

    let user = await User.findById(req.user);
    user.cart = [];
    user = await user.save();

    res.json(user);

    let order = new Order({
      products,
      totolPrice,
      address,
      userId: req.user,
      orderAt: new Date().getTime(),
    });
    order = await order.save();

    res.json(order);
  } catch (e) {
    console.error(e.message);
    res.status(500).json({error: e.message});
  }
});

//SERVER REQUEST TO GET USER ORDERS
userRouter.get('/api/orders/user_order', auth, async (req, res) => {
  try {
    let orders = await Order.find({userId: req.user});
    res.json(orders);
  } catch (e) {
    console.error(e.message);
    res.status(500).json({error: e.message});
  }
});

module.exports = userRouter;
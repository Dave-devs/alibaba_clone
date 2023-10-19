const mongoose = require('mongoose');
const { productScheme } = require('./product');

var orderSchema = mongoose.Schema({
    products: [
        {
            product: productScheme,
            quantity: {
                type: Number,
                required: true,
            }
        }
    ],
    totalPrice:{
        type: Number,
        required: true,
    },
    address:{
        type: String,
        required: true,
    },
    userId:{
        type: String,
        required: true,
    },
    orderAt:{
        type: Number,
        required: true,
    },
    status:{
        type: Number,
        default: 0,
    },
});

//Export the model
module.exports = mongoose.model('User', orderSchema);
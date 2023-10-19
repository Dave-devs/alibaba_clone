const mongoose = require('mongoose'); // Erase if already required
const {productSchema} = require('./product');

// Declare the Schema of the Mongo model
const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    email: {
        type: String,
        required: true,
        validate: {
            validator: (value) => {
                const re =  /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return value.toLowerCase().match(re);
            },
            message: "Please enter a valid email address",
        }
    },
    password: {
        type: String,
        required:true,
    },
    address: {
        type: String,
        default: "",
    },
    type: {
        type: String,
        default: 'user'
    },
    cart: [
        {
            product: productSchema,
            quantity: {
                type: Number,
                required: true,
            }
        }
    ]
});

//Export the model
module.exports = mongoose.model('User', userSchema);
const mongoose = require('mongoose');

const productScheme = new mongoose.Schema({
    productName: {
        type: String,
        required: true,
        trim: true,
    },
    description: {
        type: String,
        required: true,
        trim: true,
    },
    category: {
        type: String,
        required: true,
    },
    quantity: {
        type: Number,
        required: true,
    },
    price: {
        type: Number,
        required: true,
    },
    images: [
        {
            type: String,
            required: true
        }
    ]
})

module.exports = mongoose.model('Product', productScheme)
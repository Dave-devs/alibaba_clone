const mongoose = require('mongoose');
const ratingSchema = require('./ratings.js')

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
    ],
    ratings: [ratingSchema]
})

module.exports = mongoose.model('Product', productScheme)
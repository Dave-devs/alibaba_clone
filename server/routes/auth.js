const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');
const authRouter = express.Router('./routes/auth.js');

//SIGNUP API REQUEST
authRouter.post('/api/signup', async (req, res) => {
    try {
        //Request data from user => name, email, password and handle validations on the data;
        const {name, email, password} = req.body;

        //Validation on the server side(If passed email already exist).
        const existingUser = await User.findOne({email: email});
        if(existingUser) {
            return res.status(400).json({msg: "User with same email already exist."})
        }

        //Secure password with bcrypt.js
        const hashPassword = await bcryptjs.hash(password, 8);

        //Save data to database
        let user = new User({
            name,
            email,
            password: hashPassword,
        });
        user = await user.save();

        //Send data back to the user(when it's requested)
        res.json({user: user});

    } catch (e) {
        res.status(500).json({msg: e.message});
    }
})

module.exports = authRouter;
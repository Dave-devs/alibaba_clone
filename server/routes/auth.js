const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');
const authRouter = express.Router();
// const authRouter = express.Router('./routes/auth.js');
const jwt = require('jsonwebtoken');

//SIGNUP SERVER REQUEST
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

    } catch (error) {
        res.status(500).json({error: error.message});
    }
});

//SIGNIN SERVER REQUEST
authRouter.post('/api/signin', async (req, res) => {
    try {
        //Get user data to signin
        const {email, password} = req.body;

        //Validations
        //Validate if supplied email is present in users DB or else
        const user = await User.findOne({email: email});
        if(!user) {
            res.status(400).json({msg: "User with email does not exist!"});
        }

        //Validate if supplied password matched with one in users DB
        const isMatched = await bcryptjs.compare(password, user.password);
        if(!isMatched) {
            res.status(400).json({msg: "Password does not match!"});
        }

        /*We create a Json Web Token if above validations are true
         to get a special token as our access card to do anything within the application.*/
        const token = jwt.sign({ id: user._id }, 'passwordKey');
        //Save the data to DB
        res.json({ token, ...user._doc });
    } catch (error) {
        res.status(500).json({error: error.message});
    }
});


module.exports = authRouter;
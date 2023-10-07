 const jwt = require('jsonwebtoken');
 const User = require('../models/user');

 const admin = async(req, res, next) => {
    try {
        const token = req.header('x-auth-token');
        if(!token) {
            return res.status(401).json({msg: 'No authentication token. Access denied!'});
        }

        const isVerified = jwt.verify(token, 'passwordKey');
        if(!isVerified){
            return res.status(401).json({msg: 'Token verification failed. Access denied!'});
        }

        const user = await User.findById(isVerified.id);
        if(user.type === 'user' || user.type === 'seller') {
            return res.status(401).json({msg: 'Access Denied, You are an unauthorized user!'});
        }

        req.user = isVerified.id;
        req.token = token;
        next();
    } catch (error) {
        console.error(error.message);
        res.status(500).json({error: error.message});
    }
 }

 module.exports = admin;
const jwt = require('jsonwebtoken');

const auth = async function (req, res, next) {
    try {
        //Check if the token is present. If it is not, we return a 401 error message.
        const token = req.header('x-auth-token');
        if(!token) return res.status(401).json({msg: "No authentication token. Access denied!"});

        //Check if the token is verified. If it is not, we return a 401 error message.
        const isVerified = jwt.verify(token, 'passwordKey');
        if(!isVerified) return res.status(401).json({msg: 'Token verification failed. Access denied!'});

        /**If above verification are true, we assign them to reqest head. 
         * Then do the next thing{Next is in the router/auth.js file (token validation)}*/
        req.token = token;
        req.user = isVerified.id;
        next();
    } catch (error) {
        res.status(500).json({error: error.message});
    }
}

module.exports = auth;
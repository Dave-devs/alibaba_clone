const jwt = require('jsonwebtoken');

const auth = async (req, res, next) => {
    try {
        //Check if the token is present. If it is not, we return a 401 error message.
        const token = req.header('x-auth-token');
        if(!token) {
            return res.status(401).json({msg: "No authentication token. Access denied!"});
        }

        //Check if the token is verified. If it is not, we return a 401 error message.
        const isVerified = jwt.verify(token, 'passwordKey');
        if(!isVerified) {
            return res.status(401).json({msg: 'Token verification failed. Access denied!'});
        }

        /**If above verifications are true, we assign them to reqest head. 
         * Then do the next thing{Next is in the router/auth.js file (getting user datas)}
         */

        //New object of user and token are assigned token and verified user.
        req.token = token;
        req.user = isVerified.id;
        next();
    } catch (error) {
        res.status(500).json({error: error.message});
    }
}

module.exports = auth;
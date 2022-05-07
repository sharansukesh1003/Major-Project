const expressJwt = require('express-jwt')

// constants
const secret = process.env.SECRET
const api = process.env.API_URL

function authJwt() {
    return expressJwt({
        secret: secret,
        algorithms: ['HS256'],
    }).unless({
        path: [
            `${api}/users/login`,
            `${api}/users/register`,
        ]
    })
}

module.exports = authJwt
require('dotenv').config()
const express = require('express')
const morgan = require('morgan')
const mongoose = require('mongoose')
const cors = require('cors')
const authJwt = require('./helpers/jwt')
const errorHandler = require('./helpers/errorHandler')
const app = express()

// constants
const api = process.env.API_URL
const port = process.env.PORT

// middleware
app.use(cors())
app.options('*', cors())
app.use(express.json())
app.use(morgan('tiny'))
app.use(authJwt())
app.use(errorHandler)

// routes
const usersRoutes = require('./routes/authenticationRoute')
const profileRoutes = require('./routes/profileRoute')
const postRoutes = require('./routes/postRoute')
const newsRoutes = require('./routes/newsRoute')
const findPlayersRoutes = require('./routes/findPlayersRoute')

app.use(`${api}/users`, usersRoutes)
app.use(`${api}/posts`, postRoutes)
app.use(`${api}/profile`, profileRoutes)
app.use(`${api}/news`, newsRoutes)
app.use(`${api}/players`, findPlayersRoutes)

// server connection
app.listen(port || 5000, () => { console.log(`Server's live ${ port == undefined ? 5000 : port}`) })

// database connection
mongoose.connect(process.env.CONNECTION_STRING, () => {
    mongoose.connection.readyState == 1 ? 
    console.log("Connected to mongoDB atlas.") : 
    console.log("Could not connect to mongoDB atlas.")
})

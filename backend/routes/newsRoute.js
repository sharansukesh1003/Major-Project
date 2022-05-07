const express = require('express');
const router = express.Router();
const axios = require('axios');

// constants
const gnewsApiKey = process.env.GNEWS_API_KEY

// get default news
router.get("/", (req, res) => {
    axios.get(`https://gnews.io/api/v4/search?q=esports&token=${gnewsApiKey}&lang=en`)
        .then((response) => {
            return res.
            status(200).
            send({
                message : "Successfully retrieved data.",
                data : response.data,
                success : true
            })
        })
        .catch((error) => {
            return res.
            status(400).
            send({
                message : error.message,
                data : null,
                success : false
            })
        })
})

// get custom news
router.get("/topic", (req, res) => {
    let query = req.body.topic != null ? req.body.topic : "esports"
    axios.get(`https://gnews.io/api/v4/search?q=${query}&token=${gnewsApiKey}&lang=en`)
        .then((response) => {
            return res.
            status(200).
            send({
                message : "Successfully retrieved data.",
                data : response.data,
                success : true
            })
        })
        .catch((error) => {
            return res.
            status(400).
            send({
                message : error.message,
                data : null,
                success : false
            })
        })
})

module.exports = router
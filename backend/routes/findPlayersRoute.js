const { User } = require('../models/userModel');
const express = require('express');
const router = express.Router();

// recently joined players
router.get('/', async (req, res) => {
    const users = await User.find().sort('-date')
    if (!users) {
        return res.
        status(500)
            .send({
                message: "Something went wrong.",
                success: false
            })
    } else {
        return res
            .send({
                message : "All newly joined users.",
                users : users.reverse()
            });
    }
})

// suggested players
router.get("/suggested/:id", async (req, res) => {
    let user = await User.findById(req.params.id)
    let users = await User.find({
            reasonToPlay : user.reasonToPlay, 
            age : { $gte : user.age },
            experience : { $gte : user.experience },
            languages : { $in : [...user.languages] },
            nationality : user.nationality,
            region : user.region,
            gender : user.gender
        })
        .catch((err) => {
            return res.
                status(500).
                send({
                    message : "Server Error",
                    data : err,
                    success : false
                })
        })
        if (users) {
            users = users.filter(usr => usr.username != user.username)
            return res.
                status(200).
                send({
                    message : "Suggested Players.",
                    data : users,
                    success : true
                })
        }
        else {
            return res.
                status(400).
                send({
                    message : "Something went wrong",
                    success : false
                })
        }
})

// search players
router.post("/search", async (req, res) => {
    let reason = req.body.reason
    let game = req.body.game
    let experience = req.body.experience
    let language = req.body.language != undefined ? req.body.language : "English"
    let nationality = req.body.nationality
    let region = req.body.region
    let gender = req.body.gender
    let age = req.body.age
    console.log(reason, game, experience, language, nationality, region, gender, age)
    let users = await User.find({ 
            reasonToPlay : reason == null ? "Fun" : reason, 
            age : { $gte : age == null ? 0 : age },
            experience : { $gte : experience == null ? 0 : experience },
            mostlyPlayed : game,
            languages : language,
            nationality : nationality == null ? "none" : nationality,
            region : region == null ? "none" : region,
            gender : gender == null ? "not specified" : gender
        })
        .catch((err) => {
            return res.
                status(500).
                send({
                    message : "Server Error",
                    data : err,
                    success : false
                })
        })
        if (users) {
            return res.
                status(200).
                send({
                    message : "Found some mathces.",
                    data : users,
                    success : true
                })
        }
        else {
            return res.
                status(400).
                send({
                    message : "Something went wrong",
                    success : false
                })
        }
})

module.exports = router
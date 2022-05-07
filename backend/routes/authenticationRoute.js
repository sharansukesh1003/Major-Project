const { User } = require('../models/userModel');
const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

// constants
const secret = process.env.SECRET
const salt = process.env.SALT

// get user by id
router.get('/:id', async (req, res) => {
    const user = await User.findById(req.params.id)
    if (!user) {
        return res.
        status(500)
            .send({
                message: "User with the given ID does not exist.",
                success: false
            })
    } else {
        return res
            .send(user);
    }
})

// register user
router.post('/register', async (req, res) => {
    console.log(req.body.email)
    if (!req.body.email) return res.status(200).send({
        message: "Please enter your email.",
        success: false
    })
    let userExists = await User.findOne({email : req.body.email})
    if (userExists != undefined && userExists.username == req.body.name) {
        return res
            .status(404)
            .send({
                message: "Username already exists.",
                success: false
        })
    }
    if (!userExists) {
        let user = User({
            username: req.body.name,
            email: req.body.email,
            passwordHash: bcrypt.hashSync(req.body.password, parseInt(salt)),
        })
        user = await user.save()
        if (!user) {
            return res
                .status(500)
                .send({
                    message: "The user could not be registered.",
                    success: false
                })
        } else {
            return res.
            status(200).
            send({
                message: "Successfully registered.",
                success: true
            })
        }
    }
    if (req.body.email == userExists.email) {
        return res.
        status(400).
        send({
            message : "E-mail already exits",
            success : false
        })
    }
})

// login user
router.post('/login', async (req, res) => {
    const user = await User.findOne({email : req.body.email})
    try {
        if (!user) {
            return res.
            status(400).
            send({
                message : "User not found",
                authentication : false
            })
        }
        else {
            if (bcrypt.compareSync(req.body.password, user.passwordHash)) {
                const token = jwt.sign({ 
                    userId : user._id, 
                    userName : user.username 
                    }, 
                    secret, 
                    { 
                        expiresIn : '10d' 
                    })
                return res.
                status(200).
                send({
                    message : `Welcome back ${user.username}`,
                    token : token,
                    id : user._id,
                    authentication : true
                })
            }
            else {
                return res.
                status(400).
                send({
                    message : "Incorrect Password",
                    authentication : false
                })
            }
        }
    }
    catch(err){
        return res
        .status(400).
        send({
            message : "Something went wrong",
            authentication : false
        })
    }
})

module.exports = router
const { User } = require('../models/userModel');
const express = require('express');
const router = express.Router();

// add profile picture
router.put("/picture", async (req, res) => {
    let user = await User.findById(req.body.userId).
    catch((err) => {
        return res.
            status(500).
            send({
                message : err.message,
                success : false,
        })
    })
    if (user != undefined) {
        if (user.profilePicture == "none") {
            await user.updateOne({ profilePicture : req.body.picture }).
            catch((err) => {
                return res.
                    status(500).
                    send({
                        message : err.message,
                        success : false,
                })
            })
            return res.
                    status(200).
                    send({
                        message : "Profile picture added.",
                        success : true,
            }) 
        }
        else {
            await user.updateOne({ profilePicture : req.body.picture }).
            catch((err) => {
                return res.
                    status(500).
                    send({
                        message : err.message,
                        success : false,
                })
            })
            return res.
                    status(200).
                    send({
                        message : "Profile picture updated.",
                        success : true,
            }) 
        }
    }
})

// add (description)
router.put("/description", async (req, res) => {
    let user = await User.findById(req.body.userId).
    catch((err) => {
        return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
    })
    if (user != undefined) {
        if (user.description == "none") {
            let updatedDescription = await user.updateOne({ description : req.body.description })
            if (updatedDescription.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Description added successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
        else {
            let updatedDescription = await user.updateOne({ description : req.body.description })
            if (updatedDescription.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Description added successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
    }
})

// add (games played)
router.put("/gamesplayed", async (req, res) => {
    let user = await User.findById(req.body.userId).
        catch((err) => {
            return res.
                status(500).
                send({
                    message : err.message,
                    success : false,
            })
        })
    if (!user.gamesplayed.includes(req.body.game)) {
        await user.updateOne({ $push: { gamesplayed : req.body.game } })
        return res.
            status(200).
            send({ 
                message : "Game Added.",
                success : true
        })
    }
    else {
        return res.
            status(400).
            send({ 
                message : "Game Already Exist's.",
                success : false
        })
    }
})

// remove (games played)
router.delete("/deletegamesplayed", async (req, res) => {
    let user = await User.findById(req.body.userId).
        catch((err) => {
            return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
        })
    let deletedGame = await user.updateOne({ $pull : { gamesplayed : req.body.game }}).
        catch((err) => {
            return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
        })
    if (deletedGame.modifiedCount == 1) {
        return res.
            status(200).
            send({ 
                message : "Game removed successfully.",
                success : true
        })
    }
    else {
        return res.
            status(400).
            send({ 
                message : "Sorry no such game exist's in your repository.",
                success : false
        })
    }
})

// add (recommended games)
router.put("/recommendedgames", async (req, res) => {
    let user = await User.findById(req.body.userId).
        catch((err) => {
            return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
        })
    if (!user.recommendedGames.includes(req.body.game)) {
        await user.updateOne({ $push: { recommendedGames : req.body.game } })
        return res.
            status(200).
            send({ 
                message : "Game Added.",
                success : true
        })
    }
    else {
        return res.
            status(400).
            send({ 
                message : "Game Already Exist's.",
                success : false
        })
    }
})

// remove (recommended games)
router.delete("/deleterecommendedgames", async (req, res) => {
    let user = await User.findById(req.body.userId).
        catch((err) => {
            return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
        })
    let deletedGame = await user.updateOne({ $pull : { recommendedGames : req.body.game }}).
        catch((err) => {
            return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
        })
    if (deletedGame.modifiedCount == 1) {
        return res.
            status(200).
            send({ 
                message : "Game removed successfully.",
                success : true
        })
    }
    else {
        return res.
            status(400).
            send({ 
                message : "Sorry no such game exist's in your repository.",
                success : false
        })
    }
})

// add (mostly played)
router.put("/mostlyplayedgames", async (req, res) => {
    let user = await User.findById(req.body.userId).
        catch((err) => {
            return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
        })
    if (!user.mostlyPlayed.includes(req.body.game)) {
        await user.updateOne({ $push: { mostlyPlayed : req.body.game } })
        return res.
            status(200).
            send({ 
                message : "Game Added.",
                success : true
        })
    }
    else {
        return res.
            status(400).
            send({ 
                message : "Game Already Exist's.",
                success : false
        })
    }
})

// remove (mostly played)
router.delete("/deletemostlyplayedgames", async (req, res) => {
    let user = await User.findById(req.body.userId).
        catch((err) => {
            return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
        })
    let deletedGame = await user.updateOne({ $pull : { mostlyPlayed : req.body.game }}).
        catch((err) => {
            return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
        })
    if (deletedGame.modifiedCount == 1) {
        return res.
            status(200).
            send({ 
                message : "Game removed successfully.",
                success : true
        })
    }
    else {
        return res.
            status(400).
            send({ 
                message : "Sorry no such game exist's in your repository.",
                success : false
        })
    }
})

// add twitch
router.put("/twitch", async (req, res) => {
    let user = await User.findById(req.body.userId).
    catch((err) => {
        return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
    })
    if (user != undefined) {
        if (user.twitch == "none") {
            let updatedLink = await user.updateOne({ twitch : req.body.twitch })
            if (updatedLink.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Twitch link added successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
        else {
            let updatedLink = await user.updateOne({ twitch : req.body.twitch })
            if (updatedLink.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Twitch link updated successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
    }
})

// add youtube
router.put("/youtube", async (req, res) => {
    let user = await User.findById(req.body.userId).
    catch((err) => {
        return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
    })
    if (user != undefined) {
        if (user.youtube == "none") {
            let updatedLink = await user.updateOne({ youtube : req.body.youtube })
            if (updatedLink.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Youtube link added successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
        else {
            let updatedLink = await user.updateOne({ youtube : req.body.youtube })
            if (updatedLink.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Youtube link updated successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
    }
})

// add discord
router.put("/discord", async (req, res) => {
    let user = await User.findById(req.body.userId).
    catch((err) => {
        return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
    })
    if (user != undefined) {
        if (user.discord == "none") {
            let updatedLink = await user.updateOne({ discord : req.body.discord })
            if (updatedLink.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Discord link added successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
        else {
            let updatedLink = await user.updateOne({ discord : req.body.discord })
            if (updatedLink.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Discord link updated successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
    }
})

// add age
router.put("/age", async (req, res) => {
    let user = await User.findById(req.body.userId).
    catch((err) => {
        return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
    })
    if (user != undefined) {
        if (user.age == 0) {
            let updatedLink = await user.updateOne({ age : req.body.age })
            if (updatedLink.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Age added successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
        else {
            let updatedLink = await user.updateOne({ age : req.body.age })
            if (updatedLink.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Age updated successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(200).
                    send({ 
                        message : "Same as old value.",
                        success : false
                    })
            }
        }
    }
})

// add gender
router.put("/gender", async (req, res) => {
    let user = await User.findById(req.body.userId).
    catch((err) => {
        return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
    })
    if (user != undefined) {
        if (user.gender == 'not specified') {
            let updatedLink = await user.updateOne({ gender : req.body.gender })
            if (updatedLink.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Gender added successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
        else {
            let updatedLink = await user.updateOne({ gender : req.body.gender })
            if (updatedLink.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Gender updated successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
    }
})

// add nationality
router.put("/nationality", async (req, res) => {
    let user = await User.findById(req.body.userId).
    catch((err) => {
        return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
    })
    if (user != undefined) {
        if (user.nationality == 'none') {
            let updatedLink = await user.updateOne({ nationality : req.body.nationality })
            if (updatedLink.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Nationality added successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
        else {
            let updatedLink = await user.updateOne({ nationality : req.body.nationality })
            if (updatedLink.modifiedCount == 1) {
                return res.
                    status(200).
                    send({ 
                        message : "Gender updated successfully.",
                        success : true
                    })
            }
            else {
                return res.
                    status(400).
                    send({ 
                        message : "Invalid request.",
                        success : false
                    })
            }
        }
    }
})

module.exports = router
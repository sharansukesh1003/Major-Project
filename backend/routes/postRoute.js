const router = require("express").Router();
const { User } = require('../models/userModel');
const { Post } = require("../models/postModel");

// create post
router.post("/upload", async (req, res) => {
    let checkUser = await User.findById(req.body.id)
    .catch((err) => {
        return res.
        status(500).
        send({
            message : err.message,
            success : false,
        })
    })
    if (!checkUser) {
        return res.
        status(400).
        send({
            message : "Sign in to Post",
            success : false
        })
    } 
    let newPost = new Post({
        title : req.body.title,
        photo : req.body.photo,
        userId : req.body.id,
        username : req.body.username,
        userProfilePic : req.body.userProfilePic
    })
    newPost = await newPost.save()
    try {
        if (!newPost) {
            return res.
            status(500).
            send({ 
                message : "Something went wrong!", 
                success : false
            })
        }
        else {
            return res.
            status(200).
            send({
                message : "Post uploaded.",
                success : true
            })
        }
    }
    catch (err) {
        return res.
            status(200).
            send({
                message : "Server side error!",
                success : false,
                err : err
            })
    }
})

// delete post
router.delete("/delete", async (req, res) => {
    let post = await Post.findById(req.body.postId).
        catch((err) => {
        return res.
        status(500).
        send({
            message : err.message,
            success : false,
        })
    })
    if (post.userId.toString().split('"')[0] === req.body.userId) {
        await post.deleteOne()
        return res.
        status(200).
        send({
            message : "The post has been deleted.",
            success : true
        })
    }
    else {
        return res.
        status(403).
        send({
            message : "Invalid request.",
            success : true
        })
      }
})

// like / dislike post
router.put("/like", async (req, res) => {
    let post = await Post.findById(req.body.postId).
        catch((err) => {
        return res.
        status(500).
        send({
            message : err.message,
            success : false,
        })
    })
    if (!post.likes.includes(req.body.userId)) {
        await post.updateOne({ $push: { likes: req.body.userId } })
        return res.
        status(200).
        send({ 
            message : "The post has been liked.",
            success : true
        })
      } else {
        await post.updateOne({ $pull: { likes: req.body.userId } })
        return res.
        status(200).
        send({ 
            message : "The post has been disliked.",
            success : true
        })
      }
})

// add comment
router.put("/comment", async (req, res) => {
    let post = await Post.findById(req.body.postId).
        catch((err) => {
            return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
        })
    await post.updateOne(
        { $push: { 
            comments: { 
                username : req.body.username, 
                comment : req.body.comment 
            } 
        }
    })
    return res.
        status(200).
        send({ 
            message : "Commented Successfully.",
            success : true
        })
})

// delete comment
router.delete("/deletecomment", async (req, res) => {
    let post = await Post.findById(req.body.postId).
        catch((err) => {
            return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
        })
    let deletedComment = await post.updateOne(
        { $pull : 
            { comments : 
                { comment : req.body.comment } 
            }
        }).
        catch((err) => {
            return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
        })
    if (deletedComment.modifiedCount == 1) {
        return res.
            status(200).
            send({ 
                message : "Comment delted successfully.",
                success : true
        })
    }
    else {
        return res.
            status(400).
            send({ 
                message : "Invalid Request",
                success : false
        })
    }
})

// get post by id
router.get("/getpost", async (req, res) => {
    let post = await Post.findById(req.body.postId).
        catch((err) => {
            return res.
            status(500).
            send({
                message : err.message,
                success : false,
            })
        })
    if (post != null) {
        return res.
        status(200).
        send({
            message : "Post retrieved successfully.",
            success : true,
            data : post 
        }) 
    }
    else {
        return res.
        status(200).
        send({
            message : "Invalid Post Id.",
            success : false,
        })
    }
})

// get user posts
router.get("/user/posts/:id", async (req, res) => {
    try {
      const user = await User.findById(req.params.id).sort('-date')
      const userPosts = await Post.find({ userId: user._id })
      return res.
      status(200).
      send({
          message : "Post's retrieved successfully.",
          success : true,
          posts : userPosts.reverse()
      })
    } catch (err) {
        return res.
        status(500).
        send({
            message : "Invalid Object Id",
            success : false,
        })
    }
})

// get feed posts
router.get("/feed/posts", async (req, res) => {
    try {
      const userPosts = await Post.find()
      return res.
      status(200).
      send({
          message : "Post's retrieved successfully.",
          success : true,
          posts : userPosts
      })
    } catch (err) {
        return res.
        status(500).
        send({
            message : err.message,
            success : false,
        })
    }
})

module.exports = router
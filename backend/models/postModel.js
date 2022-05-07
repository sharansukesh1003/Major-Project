const mongoose = require("mongoose");

const PostSchema = new mongoose.Schema({
    title: {
      type: String,
      required: true,
    },
    photo: {
      type: String,
      required: false,
    },
    userId: {
      type: mongoose.Schema.Types.ObjectId,
      ref : 'User',
      required: true,
    },
    username: {
      type: String,
      required: true,
    },
    userProfilePic: {
      type: String,
      required: true,
    },
    likes: {
        type: Array,
        default: [],
    },
    comments: {
        type: [],
        default: []
    }
}, { versionKey: false });

exports.Post = mongoose.model('Post', PostSchema)
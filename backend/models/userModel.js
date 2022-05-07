const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    username: {
        type: String,
        required: true,
    },
    email: {
        type: String,
        required: true,
    },
    passwordHash: {
        type: String,
        required: true,
    },
    profilePicture: {
        type: String,
        default: 'none'
    },
    description: {
        type: String,
        default: "none"
    },
    recentlyPlayed: {
        type: [mongoose.Schema.Types.ObjectId],
        ref : 'User',
    },
    gamesPlayed: {
        type: [String],
        default: [],
    },
    recommendedGames: {
        type: [String],
        default: [],
    },
    mostlyPlayed: {
        type: String,
    },
    reasonToPlay: {
        type: String,
        default: 'Fun'
    },
    twitch:{
        type: String,
        default: 'none'
    },
    youtube: {
        type: String,
        default: 'none'
    },
    discord: {
        type: String,
        default: 'none'
    },
    experience: {
        type: Number,
        default: 0
    },
    languages: {
        type: [String],
        default: []
    },
    nationality: {
        type: String,
        default: "none"
    },
    region: {
        type: String,
        default: "none"
    },
    gender: {
        type: String,
        default: "not specified"
    },
    age: {
        type: Number,
        default: 0
    }
}, { versionKey: false });

exports.User = mongoose.model('User', userSchema);

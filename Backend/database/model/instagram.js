const conn = require('../Mysql/index.js')

module.exports = {
    getAllUsers: (callback) => {
        const sql = "SELECT * FROM users;";
        conn.query(sql, function (err, res) {
            callback(err, res);
        });
    },
    getAllPosts: (callback) => {
        const sql = "SELECT * FROM posts;";
        conn.query(sql, function (err, res) {
            callback(err, res);
        });
    },
    getAllPostsByUser: (callback, userId) => {
        const sql = "SELECT * FROM posts WHERE users_idusers = ?;";
        conn.query(sql, [userId], function (err, res) {
            callback(err, res);
        });
    },
    getAllFollowersByUser: (callback, userId) => {
        const sql = "SELECT * FROM followers WHERE users_idusers = ?;";
        conn.query(sql, [userId], function (err, res) {
            callback(err, res);
        });
    },
    getAllFollowingByUser: (callback, userId) => {
        const sql = "SELECT * FROM following WHERE users_idusers = ?;";
        conn.query(sql, [userId], function (err, res) {
            callback(err, res);
        });
    },
    getAllLikesByPost: (callback, postId) => {
        const sql = "SELECT * FROM likes WHERE posts_idposts = ?;";
        conn.query(sql, [postId], function (err, res) {
            callback(err, res);
        });
    },
    getAllLikesByUser: (callback, userId) => {
        const sql = "SELECT * FROM likes WHERE users_idusers = ?;";
        conn.query(sql, [userId], function (err, res) {
            callback(err, res);
        });
    },
    addOneUser: (callback, data) => {
        const sql = "INSERT INTO users (name, passwords) VALUES (?, ?);";
        conn.query(sql, data, function (err, res) {
            callback(err, res);
        });
    },
    addOnePost: (callback, data) => {
        const sql = "INSERT INTO posts (title,comments,users_idusers ) VALUES (?, ?, ?);";
        conn.query(sql, data, function (err, res) {
            callback(err, res);
        });
    },
    addOneFollower: (callback, data) => {
        const sql = "INSERT INTO followers (users_idusers) VALUES (?);";
        conn.query(sql, data, function (err, res) {
            callback(err, res);
        });
    },
    addOneFollowing: (callback, data) => {
        const sql = "INSERT INTO following (users_idusers) VALUES (?);";
        conn.query(sql, data, function (err, res) {
            callback(err, res);
        });
    },
    addOneLike: (callback, data) => {
        const sql = "INSERT INTO likes (users_idusers, posts_idposts) VALUES (?, ?);";
        conn.query(sql, data, function (err, res) {
            callback(err, res);
        });
    }
}

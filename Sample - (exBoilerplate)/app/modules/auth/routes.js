var express = require('express');
var loginRouter = express.Router();
var logoutRouter = express.Router();
var sweetAlert = require('sweetAlert');

var authMiddleware = require('./middlewares/auth');

loginRouter.route('/')
    .get(authMiddleware.noAuthed, (req, res) => {
        res.render('auth/views/loginform', req.query);
    })
    .post((req, res) => {
        var db = require('../../lib/database')();

        db.query(`SELECT * FROM tbladmin WHERE strUsername="${req.body.username}"`, (err, results, fields) => {
            if (err) throw err;
            console.log(err);
            if (results.length === 0) 
            {
                return res.redirect('/login?incorrect');
                sweetAlert("Success","you have logged in"," sucess");
            }
            var user = results[0];

            if (user.strPassword !== req.body.password) return res.redirect('/login?incorrect');
 
            delete user.strPassword;

            req.session.user = user;

            return res.redirect('/');
        });
    });

logoutRouter.get('/', (req, res) => {
    req.session.destroy(err => {
        if (err) throw err;
        res.redirect('/login');
    });
});

exports.login = loginRouter;
exports.logout = logoutRouter;
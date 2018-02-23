var express = require('express');
var loginRouter = express.Router();
var logoutRouter = express.Router();
var signupRouter = express.Router();

var authMiddleware = require('./middlewares/auth');

loginRouter.route('/')
    .get(authMiddleware.noAuthed, (req, res) => {
        res.render('eyenet/views/eyenetLogin', req.query);
    })
    .post((req, res) => {
        var db = require('../../lib/database')();

        db.query(`SELECT * FROM tblaccount WHERE intAccountUsername="${req.body.username}"`, (err, results, fields) => {
            if (err) throw err;
            console.log(err);

            if (results.length === 0) 
            {
                return res.redirect('/login?incorrect');
                
            }
            var user = results[0];
            console.log(user);
            req.session.user = user;
            
            if(req.session.user.intAccountUserTypeID===1)
            {
                if (user.strAccountPassword !== req.body.password) return res.redirect('/login?incorrect');

                delete user.strAccountPassword;

                req.session.user = user;

                return res.redirect('/eyenetAdmin/dashboard');
            }
            else if(req.session.user.intAccountUserTypeID===2)
            {
                if (user.strAccountPassword !== req.body.password) return res.redirect('/login?incorrect');

                delete user.strAccountPassword;

                req.session.user = user;

                return res.redirect('/eyenetUsers/dashboard');
            }
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
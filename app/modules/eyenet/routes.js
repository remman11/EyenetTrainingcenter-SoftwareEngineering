var express = require('express');
var router = express.Router();
var db = require('../../lib/database')();
var authMiddleware = require('../auth/middlewares/auth');
var counter = require('../auth/middlewares/SC');

var aboutRouter = express.Router();
var contactRouter = express.Router();
var indexRouter = express.Router();
var loginRouter = express.Router();
var signupRouter = express.Router();
var inquireRouter = express.Router();
indexRouter.get('/',(req,res)=>{
    res.render('eyenet/views/home');
});

aboutRouter.get('/',(req,res)=>{
    res.render('eyenet/views/about');
});
contactRouter.get('/',(req,res)=>{
    res.render('eyenet/contact-page/contact');
});
inquireRouter.get('/',(req,res)=>{
    res.render('eyenet/views/inquire');
});
inquireRouter.post('/',(req,res)=>{
    db.query(`insert into tblinquiry
        (strGuestName,
        strISubject,
        strGuestEmail,
        strIMessage) 
        values
        ("${req.body.gname}","${req.body.subject}","${req.body.email}","${req.body.message}");`,(err,results,field)=>{
            if(err) throw err;
            res.redirect('/login');
        });
});

exports.inquire = inquireRouter;
exports.home = indexRouter;
exports.about = aboutRouter;
exports.contact = contactRouter;
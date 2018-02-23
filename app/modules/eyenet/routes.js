var express = require('express');
var router = express.Router();
var db = require('../../lib/database')();
var authMiddleware = require('../auth/middlewares/auth');
var counter = require('../auth/middlewares/SC');

var aboutRouter = express.Router();
var contactRouter = express.Router();
var indexRouter = express.Router();
var loginRouter = express.Router();

indexRouter.get('/',(req,res)=>{
    res.render('eyenet/views/home');
});

aboutRouter.get('/',(req,res)=>{
    res.render('eyenet/views/about');
});
contactRouter.get('/',(req,res)=>{
    res.render('eyenet/views/contact');
});

exports.home = indexRouter;
exports.about = aboutRouter;
exports.contact = contactRouter;
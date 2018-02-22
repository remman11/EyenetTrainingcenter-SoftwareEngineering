var express = require('express');
var router = express.Router();
var db = require('../../lib/database')();
var authMiddleware = require('../auth/middlewares/auth');
var counter = require('../auth/middlewares/SC');

router.get('/home',(req,res)=>{
    res.render('eyenet/views/home');
});

router.get('/about',(req,res)=>{
    res.render('eyenet/views/about');
});
router.get('/contact',(req,res)=>{
    res.render('eyenet/views/contact');
});
exports.eyenet = router;
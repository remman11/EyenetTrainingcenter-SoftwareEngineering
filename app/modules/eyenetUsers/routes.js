var express = require('express');
var router = express.Router();
var db = require('../../lib/database')();
var authMiddleware = require('../auth/middlewares/auth');
var counter = require('../auth/middlewares/SC');

router.get(`/dashboard`,(req,res)=>{
    var logs = req.session.user;
    console.log('start dito',logs);
    console.log('king ina dito sya nabobobo.');
    db.query(`select * from tbluserinfo where intUserinfoID = "${logs.intAccountUserInfoID}"`,(err,results,field)=>{
        return res.render('eyenetUsers/views/dashboard',{cats : results});
    });
    console.log('hindi sya bobo.'); 
});
exports.eyenetUsers = router;
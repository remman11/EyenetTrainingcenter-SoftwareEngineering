var express = require('express');
var router = express.Router();
var db = require('../../lib/database')();
var authMiddleware = require('../auth/middlewares/auth');
var counter = require('../auth/middlewares/SC');

function names(req,res,next){
    db.query(`select * from tbluser where intUserID = "${req.session.user.intAUserID}"`,(err,results,field)=>{
        req.names =  results;
        return next();
    });
}
function renderDashboard(req,res){
    res.render('eyenetUsers/views/dashboard',{cats: req.names})
}
router.get(`/dashboard/:strAUsername`,names,renderDashboard,(req,res)=>{});
router.get(`/courseinfo`,(req,res)=>{
    db.query(`select * from tblusercoursedetails where intSLUserID = "${req.session.user.intAUserID}"`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        if(results[0]==null) res.redirect('/dashboard');
        res.render(`eyenetUsers/views/CourseInformation`,{form : results[0]});
    })
});

router.get(`/documents`,(req,res)=>{
    res.render(`eyenetUsers/views/documents`);
});
exports.eyenetUsers = router;
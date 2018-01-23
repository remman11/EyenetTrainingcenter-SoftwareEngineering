var router = require('express').Router();
var db = require('../../lib/database')();
var authMiddleware = require('../auth/middlewares/auth');
var counter = require('../auth/middlewares/SC');

router.use((req, res, next) => {
    res.locals.activeTab = req.query.active;
    return next();
});
router.get('/home',(req,res)=>{
    res.render('eyenetfrontpage/views/home');
}); 
router.get('/equipments',(req,res)=>{
    res.render('eyenetfrontpage/views/equipment-admin-add');
});
router.get('/equip',(req,res)=>{
    res.render('eyenetfrontpage/views/equipments-admin');
});
router.get('/main',(req,res)=>{
    res.render('eyenetfrontpage/views/maintenance-users-admin');
});
router.get('/reservation',(req,res)=>{
    res.render('eyenetfrontpage/views/reservation-admin');
});
router.get('/maintenance/reservations',(req,res)=>{
    res.render('eyenetfrontpage/views/reservationInquiry');
});
router.get('/maintenance/users',(req,res)=>{
    res.render('eyenetfrontpage/views/usertype');
});
router.get('/maintenance/equipmenttype',(req,res)=>{
    res.render('eyenetfrontpage/views/equipmentM');
});
router.get('/maintenance/qstudent',(req,res)=>{
    authMiddleware.hasAuth
    res.render('eyenetfrontpage/views/studentList');
});
router.get('/maintenanance/qstudent',(req,res)=>{
    res.render('eyenetfrontpage/views/studentList');
});






router.get('/',authMiddleware.hasAuth,(req,res)=>{
    db.query(`select * from tblfp where is_Deleted = "0"`,(err,results,field)=>{
        return res.render('Faculty/views/DIT',{Fprofiles : results});
    });
});

function PS(req,res,next){
    db.query(`select * from tblcivilstatus`,(err,res,field)=>{
        req.CS = res;
        return next();
    });
}
function PD(req,res,next){
    db.query(`select * from tblcitizenship`,(err,resu,field)=>{
        req.CT = resu;
        return next();
    });
}
function PF(req,res,next){
    db.query(`select * from tbldepartment`,(err,resul,field)=>{
        req.depts = resul;
        return next();
    });
}
function PG(req,res,next){
    db.query(`select * from tblEmployeeType`,(err,result,field)=>{
        req.emp = result;
        return next();
    })
}
function renderPage(req,res){
    db.query(`SELECT MAX(strFacultyID) AS strFacultyID FROM tblfacultyprofile`,(err,results,field)=>{
        res.locals.ID = results[0].strFacultyID;
        return res.render('eyenetfrontpage/views/studenList',{CS : req.CS, CT : req.CT, depts : req.depts, emp : req.emp});
    })
}
router.get('/add/P',authMiddleware.hasAuth,PS,PD,PF,PG,renderPage);
exports.eyenet = router;
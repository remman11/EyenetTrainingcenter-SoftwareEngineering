var express = require('express');
var router = express.Router();
var db = require('../../lib/database')();
var authMiddleware = require('../auth/middlewares/auth');
var counter = require('../auth/middlewares/SC');


router.get('/dashboard',(req,res)=>{
    res.render('eyenetAdmin/views/dashboard');
});

//안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 

//equipment type interface

router.get('/equiptype',authMiddleware.hasAuth,(req,res)=>{
    db.query(`select * from tblequiptype`,(err,results,field)=>{
        if(err) throw err;
        console.log(results+"this is?");
        console.log('nag rerender');
        return res.render('eyenetAdmin/views/maintenance/pages/EquipmentType',{kicks:results});
    });
});

router.get('/equiptype/new',(req,res)=>{
    db.query(`select max(intEquipTypeID) as intEquipTypeID from tblequiptype`,(err,results,field)=>{
        res.locals.ID = results[0].intEquipTypeID
        return res.render('eyenetAdmin/views/maintenance/forms/EquipmentForm');
    }) 
});
router.post('/equiptype/new',(req,res)=>{
    var nID = counter.smart(req.body.sid);
    db.query(`insert into tblequiptype (intEquipTypeID,strEquipTypeName) VALUES ("${nID}","${req.body.utypename}");`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        return res.redirect('/eyenetAdmin/equiptype');
    }) 
});
router.get('/equiptype/:intEquipTypeID',authMiddleware.hasAuth,(req,res)=>{
    db.query(`SELECT * FROM tblequiptype where intEquipTypeID =  "${req.params.intEquipTypeID}"`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        if(results[0]==null) res.redirect('/eyenet/equiptype');
        res.render('eyenetAdmin/views/maintenance/forms/EquipmentForm',{hips : results[0] });
    })
});

router.put('/equiptype/:intEquipTypeID',(req,res)=>{
    db.query(`update tblequiptype set
    strEquipTypeName = "${req.body.utypename}"
    where intEqupTypeID = "${req.params.intEquipTypeID}"`,(err,results,field)=>{
        if(err) throw err;
        res.redirect('/eyenetAdmin/equiptype');
    })
});

router.get('/equiptype/:intEquipTypeID/delete',(req,res)=>{
    db.query(`DELETE FROM tblequiptype WHERE intEquipTypeID = "${req.params.intEquipTypeID}"`,(err,results,field)=>{
        if(err) throw err;
        res.redirect('/eyenetAdmin/equiptype');
    });
});

//end of equiptype

// 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 


//안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 

// usertype Interface

router.get('/usertype',authMiddleware.hasAuth,(req,res)=>{
    db.query(`select * from tblusertype`,(err,results,field)=>{
        return res.render('eyenetAdmin/views/maintenance/pages/UserType',{users : results});
        console.log(results);    
    })  
});
router.get('/usertype/new',(req,res)=>{
    db.query(`select max(intUserTypeID) as intUserTypeID from tblusertype`,(err,results,field0)=>{
        res.locals.ID = results[0].intUserTypeID
        return res.render('eyenetAdmin/views/maintenance/forms/UserTypeForm');
    }) 
});
router.post('/usertype/new',(req,res)=>{
    var nID = counter.smart(req.body.smid);
    db.query(`insert into tblusertype (intUserTypeID,strUserTypeName) VALUES ("${nID}","${req.body.etypename}");`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        return res.redirect('/eyenetAdmin/usertype');
    }) 
});
router.get('/usertype/:intUserTypeID',authMiddleware.hasAuth,(req,res)=>{
    db.query(`SELECT * FROM tblusertype where intUserTypeID =  "${req.params.intUserTypeID}"`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        if(results[0]==null) res.redirect('/eyenetAdmin/usertype');
        res.render('eyenetAdmin/views/maintenance/forms/UserTypeForm',{form : results[0] });
    })
});

router.put('/usertype/:intUserTypeID',(req,res)=>{
    db.query(`update tblusertype set
    strUserTypeName = "${req.body.etypename}"
    where intUserTypeID = "${req.params.intUserTypeID}"`,(err,results,field)=>{
        if(err) throw err;
        res.redirect('/eyenetAdmin/usertype');
    })
});

router.get('/usertype/:intUserTypeID/delete',(req,res)=>{
    db.query(`DELETE FROM tblusertype WHERE intUserTypeID = "${req.params.intUserTypeID}"`,(err,results,field)=>{
        if(err) throw err;
        res.redirect('/eyenetAdmin/usertype');
    });
});

// end of usertype

// 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 

// 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 

// Schedule

router.get('/scheduleList',(req,res)=>{
    db.query(`select * from tblsched`,(err,results,field)=>{
        return res.render('eyenetAdmin/views/maintenance/pages/schedule',{users : results});
        console.log(results);  
    })
});
router.get('/createSchedule',(req,res)=>{
    res.render('eyenetAdmin/views/maintenance/forms/ScheduleForm');
});
router.post('/newsched',(req,res)=>{
    var use = 1;
    var sch = 1;
    

    db.query(`insert into tblsched (datStartDate,
        datEndDate,
        strSchedRemarks,
        intSchedCourseID,
        intSchedUserInfoID,
        intSchedStatus) 
    VALUES ("${req.body.dstart}",
    "${req.body.dend}",
    "${req.body.rem}",
    ${req.body.scourse},
    ${use},
    ${sch});`,(err,results,field)=>{
        if(err) throw err;
        console.log(use,sch);
        console.log(err);
        
        return res.redirect('/eyenetAdmin/scheduleList');
    }) 
});

//end Schedule
 
// 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 

// 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 

//student list

router.get('/studentList',(req,res)=>{
    res.render('eyenetAdmin/views/reports/students');
});

exports.eyenetAdmin = router;
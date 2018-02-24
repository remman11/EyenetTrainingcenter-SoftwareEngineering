var express = require('express');
var router = express.Router();
var db = require('../../lib/database')();
var authMiddleware = require('../auth/middlewares/auth');
var counter = require('../auth/middlewares/SC');

router.use((req, res, next) => {
    res.locals.activeTab = req.query.active;
    return next();
});

router.get('/dashboard',(req,res)=>{
    res.render('eyenetAdmin/views/dashboard');
});

//안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 

// course maintenance interface backend

function status(req,res,next){
    db.query(`select * from tblstatus`,(err,results,field)=>{
        req.fields = results;
        return next();
    });
}
function renderStatus(req,res){
    res.render(`eyenetAdmin/views/maintenance/forms/CourseForm`,{ships : req.fields});
}

router.get('/course',authMiddleware.hasAuth,(req,res)=>{
    db.query(`select * from tblcourse`,(err,results,field)=>{
        return res.render('eyenetAdmin/views/maintenance/pages/Course',{users : results});
        console.log(results);    
    })  
});
router.get('/course/new',(req,res)=>{
    db.query(`select max(intCID) as intCID from tblcourse`,(err,results,field)=>{
        res.locals.ID = results[0].intCID
        return res.render('eyenetAdmin/views/maintenance/forms/CourseForm');
    }) 
});
router.post('/course/new',(req,res)=>{
    var nID = counter.smart(req.body.smid);
    db.query(`insert into tblcourse (intCID,strCName,strCDetails,fltCFee) VALUES ("${nID}","${req.body.etypename}","${req.body.desc}","${req.body.cfee}");`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        return res.redirect('/eyenetAdmin/course');
    }) 
});
router.get('/course/:intCID',authMiddleware.hasAuth,(req,res)=>{
    db.query(`SELECT * FROM tblcourse where intCID =  "${req.params.intCID}"`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        if(results[0]==null) res.redirect('/eyenetAdmin/course');
        res.render('eyenetAdmin/views/maintenance/forms/CourseForm',{form : results[0]});
    })
});

router.put('/course/:intCID',(req,res)=>{
    db.query(`update tblcourse set
    strCName = "${req.body.etypename}", 
    strCDetails = "${req.body.desc}",
    fltCFee = "${req.body.cfee}"
    where intCID = "${req.params.iCID}"`,(err,results,field)=>{
        if(err) throw err;
        res.redirect('/eyenetAdmin/course');
    })
});

router.get('/course/:intUserTypeID/delete',(req,res)=>{
    db.query(`DELETE FROM tblcourse WHERE intCID = "${req.params.intCID}"`,(err,results,field)=>{
        if(err) throw err;
        res.redirect('/eyenetAdmin/course');
    });
});




//end of Course

// 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 


//안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 

//equipment type maintenance interface backend

router.get('/equiptype',authMiddleware.hasAuth,(req,res)=>{
    db.query(`select * from tblequiptype`,(err,results,field)=>{
        return res.render('eyenetAdmin/views/maintenance/pages/EquipmentType',{users : results});
        console.log(results);    
    })  
});
router.get('/equiptype/new',(req,res)=>{
    db.query(`select max(intEquipTypeID) as intEquipTypeID from tblequiptype`,(err,results,field)=>{
        res.locals.ID = results[0].intEquipTypeID
        return res.render('eyenetAdmin/views/maintenance/forms/EquipmentForm');
    }) 
});
router.post('/equiptype/new',(req,res)=>{
    var nID = counter.smart(req.body.smid);
    db.query(`insert into tblequiptype (intEquipTypeID,strETName) VALUES ("${nID}","${req.body.etypename}");`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        return res.redirect('/eyenetAdmin/equiptype');
    }) 
});
router.get('/equiptype/:intEquipTypeID',authMiddleware.hasAuth,(req,res)=>{
    db.query(`SELECT * FROM tblequiptype where intEquipTypeID =  "${req.params.intEquipTypeID}"`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        if(results[0]==null) res.redirect('/eyenetAdmin/equiptype');
        res.render('eyenetAdmin/views/maintenance/forms/EquipmentForm',{form : results[0] });
    })
});

router.put('/equiptype/:intEquipTypeID',(req,res)=>{
    db.query(`update tblequiptype set
    strETName = "${req.body.etypename}"
    where intEquipTypeID = "${req.params.intEquipTypeID}"`,(err,results,field)=>{
        if(err) throw err;
        res.redirect('/eyenetAdmin/equiptype');
    })
});

router.get('/equiptype/:intUserTypeID/delete',(req,res)=>{
    db.query(`DELETE FROM tblequiptype WHERE intEquipTypeID = "${req.params.intEquipTypeID}"`,(err,results,field)=>{
        if(err) throw err;
        res.redirect('/eyenetAdmin/usertype');
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
    db.query(`select max(intUserTypeID) as intUserTypeID from tblusertype`,(err,results,field)=>{
        res.locals.ID = results[0].intUserTypeID
        return res.render('eyenetAdmin/views/maintenance/forms/UserTypeForm');
    }) 
});
router.post('/usertype/new',(req,res)=>{
    var nID = counter.smart(req.body.smid);
    db.query(`insert into tblusertype (intUserTypeID,strUTName) VALUES ("${nID}","${req.body.etypename}");`,(err,results,field)=>{
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
    strUTName = "${req.body.etypename}"
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

//status Type

router.get('/statustype',authMiddleware.hasAuth,(req,res)=>{
    db.query(`select * from tblstatus`,(err,results,field)=>{
        return res.render('eyenetAdmin/views/maintenance/pages/StatusType',{users : results});
        console.log(results);    
    })  
});
router.get('/statustype/new',(req,res)=>{
    db.query(`select max(intStatusID) as intStatusID from tblstatus`,(err,results,field)=>{
        res.locals.ID = results[0].intStatusID
        return res.render('eyenetAdmin/views/maintenance/forms/StatusTypeForm');
    }) 
});
router.post('/statustype/new',(req,res)=>{
    var nID = counter.smart(req.body.smid);
    db.query(`insert into tblstatus (intStatusID,strStatusDesc) VALUES ("${nID}","${req.body.etypename}");`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        return res.redirect('/eyenetAdmin/statustype');
    }) 
});
router.get('/statustype/:intStatusID',authMiddleware.hasAuth,(req,res)=>{
    db.query(`SELECT * FROM tblstatus where intStatusID =  "${req.params.intStatusID}"`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        if(results[0]==null) res.redirect('/eyenetAdmin/statustype');
        res.render('eyenetAdmin/views/maintenance/forms/StatusTypeForm',{form : results[0] });
    })
});

router.put('/statustype/:intStatusID',(req,res)=>{
    db.query(`update tblstatus set
    strStatusDesc = "${req.body.etypename}"
    where intStatusID = "${req.params.intUserTypeID}"`,(err,results,field)=>{
        if(err) throw err;
        res.redirect('/eyenetAdmin/statustype');
    })
});

router.get('/statustype/:intStatusID/delete',(req,res)=>{
    db.query(`DELETE FROM tblstatus WHERE intStatusID = "${req.params.intStatusID}"`,(err,results,field)=>{
        if(err) throw err;
        res.redirect('/eyenetAdmin/statustype');
    });
});

// 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 

// 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 

// Schedule

function proctor(req,res,next){
    db.query(`select * from tblproctor`,(err,results,field)=>{
        req.proctors = results;
        return next();
    });
}
function course(req,res,next){
    db.query(`select * from tblcourse`,(err,resu,fiel)=>{
        req.courses = resu;
        return next();
    });
}
function renderSchedpage(req,res){
    res.render(`eyenetAdmin/views/maintenance/forms/ScheduleForm`,{nips : req.fields, tips : req.proctors, lips : req.courses});
}

router.get('/createSchedule',authMiddleware.hasAuth,status,proctor,course,renderSchedpage);
router.get('/scheduleList',authMiddleware.hasAuth,course);

router.get('/scheduleList',(req,res)=>{
    db.query(`select * from tblsched`,(err,results,field)=>{
        return res.render('eyenetAdmin/views/maintenance/pages/schedule',{users : results});
        console.log(results);  
    })
});

router.get('/scheduleList/:intSchedID/view',authMiddleware.hasAuth,(req,res)=>{
    db.query(`SELECT * FROM tblusertype where intUserTypeID =  "${req.params.intUserTypeID}"`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        if(results[0]==null) res.redirect('/eyenetAdmin/usertype');
        res.render('eyenetAdmin/views/maintenance/forms/UserTypeForm',{form : results[0] });
    })
}); 

router.post('/newsched',(req,res)=>{
    
    db.query(`insert into tblsched (datStartDate,
        datEndDate,
        strSRemarks,
        intSCourseID,
        intSStatusID,
        intProctorID) 
    VALUES ("${req.body.dstart}",
    "${req.body.dend}",
    "${req.body.rem}",
    ${req.body.scourse},
    ${req.body.stats},
    ${req.body.procs});`,(err,results,field)=>{
        if(err) throw err;
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

// 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 

// 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 

// proctor maintenance interface backend

router.get('/proctors',authMiddleware.hasAuth,(req,res)=>{
    db.query(`select * from tblproctor`,(err,results,field)=>{
        return res.render('eyenetAdmin/views/maintenance/pages/Proctor',{users : results});
        console.log(results);    
    })  
});
router.get('/proctors/new',(req,res)=>{
    db.query(`select max(intProctorID) as inProctorID from tblproctor`,(err,results,field)=>{
        res.locals.ID = results[0].intProctorID
        return res.render('eyenetAdmin/views/maintenance/forms/ProctorForm');
    }) 
});
router.post('/proctors/new',(req,res)=>{
    var nID = counter.smart(req.body.smid);
    db.query(`insert into tblproctor (intProctorID,strProctorName) VALUES ("${nID}","${req.body.etypename}");`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        return res.redirect('/eyenetAdmin/proctors');
    }) 
});
router.get('/proctors/:intProctorID',authMiddleware.hasAuth,(req,res)=>{
    db.query(`SELECT * FROM tblproctor where intProctorID =  "${req.params.intProctorID}"`,(err,results,field)=>{
        if(err) throw err;
        console.log(err);
        if(results[0]==null) res.redirect('/eyenetAdmin/proctors');
        res.render('eyenetAdmin/views/maintenance/forms/ProctorForm',{form : results[0]});
    })
});

router.put('/proctors/:intProctorID',(req,res)=>{
    db.query(`update tblproctor set
    strProctorName = "${req.body.etypename}"
    where intProctorID = "${req.params.intProctorID}"`,(err,results,field)=>{
        if(err) throw err;
        res.redirect('/eyenetAdmin/proctors');
    })
});

router.get('/proctors/:intProctorID/delete',(req,res)=>{
    db.query(`DELETE FROM tblproctor WHERE intProctorID = "${req.params.intProctorID}"`,(err,results,field)=>{
        if(err) throw err;
        res.redirect('/eyenetAdmin/usertype');
    });
});

// end of proctor

// 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 안냐 

// 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 안녕 

exports.eyenetAdmin = router;
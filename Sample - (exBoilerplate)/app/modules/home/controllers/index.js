module.exports = (req, res) => {
    console.log(req.session);
    res.render('eyenetfrontpage/views/equipmentM');
    
}
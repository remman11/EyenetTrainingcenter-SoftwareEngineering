module.exports = (req, res) => {
    console.log(req.session);
    res.redirect('/eyenet/home');
}
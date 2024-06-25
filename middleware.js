const crypto=require('crypto');
const userConnection = require("./routes/userDbConnect");

module.exports.validPassword = (password,hash,salt) => {
    var hashVerify=crypto.pbkdf2Sync(password,salt,10000,60,'sha512').toString('hex');
    return hash === hashVerify;
 }
 
module.exports.genPassword = (password) => {
    var salt=crypto.randomBytes(32).toString('hex');
    var genhash=crypto.pbkdf2Sync(password,salt,10000,60,'sha512').toString('hex');
    return {salt:salt,hash:genhash};
 }
 
 module.exports.isAuth = (req,res,next) => {
    if(req.isAuthenticated()){
        next();
    }
    else{
        res.redirect('/admin/login');
    }
 }
 
 module.exports.isAdmin = (req,res,next) => {
    if(req.isAuthenticated() && req.user.isAdmin==1){
        next();
    }
    else{
     res.redirect('/admin/login'); 
    }  
}
 
module.exports.userExists = (req,res,next) => {
    userConnection.query('Select * from users where username=? ', [req.body.uname], function(error, results, fields) {
        if (error) console.log("Error");
            else if(results.length>0){
                req.flash("msg", "Admin already exists, please login!")
                res.redirect("/admin/login");
            } 
            else next();
    });
}
if(process.env.NODE_ENV != "production"){
    require('dotenv').config();
}
const express=require("express");
const app=express();
const path=require("path");
const ejsMate=require("ejs-mate");
const methodOverride=require("method-override");
session = require("express-session");
const flash = require("connect-flash");
const ExpressError=require("./utils/ExpressError.js");
const { wrap } = require("module");

const newJoinRouter = require("./routes/new-join.js");
const bdayRouter = require("./routes/bday.js");
const retireRouter = require("./routes/retire.js");
const adminRouter = require("./routes/admin.js");
const empRouter = require("./routes/employee.js");

app.engine("ejs",ejsMate);

app.set("view engine","ejs");
app.set("views",path.join(__dirname,"/views"));
app.use(express.static(path.join(__dirname,"public")));

app.use(methodOverride("_method"));
app.use(express.urlencoded({extended:true}));

const indexController = require("./controllers/index.js");

const port=8080;
const connection = require("./routes/dbConnect.js");

const sessionOptions = {
    secret: "mysupersecretcode",
    resave: false,
    saveUninitialized: true,
    cookie: {
        expires: Date.now() + 7 *24 * 60 * 60 * 1000, //7 days from now
        maxAge: 7 * 24 * 60 * 60 * 1000,
        httpOnly: true,
    }
}

app.use(session(sessionOptions));
app.use(flash());
app.use((req,res,next)=>{
    res.locals.success = req.flash("success"); // store the flash msg in locals of response object
    res.locals.error = req.flash("error");
    // res.locals.currUser = req.user;
    next();
})
// app.use((req,res,next) => {
//     if(req.url != "/"){
//         console.log("not on homepage");
//         nav_below.style.display = "none";
//     }
//     console.log(req.url);
//     console.log(req.originalMethod);
//     next();
// })



app.use("/bday", bdayRouter);
app.use("/retire", retireRouter);
app.use("/new-join", newJoinRouter);
app.use("/admin", adminRouter);
app.use("/emp", empRouter);

app.post("/signup",(req,res)=>{
    const { id, usnm, pswd } = req.body;
    res.render("/admin/show");
})

app.get("/signup",(req,res)=>{
    res.render("./routes/signupAdmin.ejs");
})

app.post('/login', (req, res) => {
    const { id, usnm, pswd } = req.body;
    const adminQuery = 'SELECT * FROM adminpasswords WHERE id = ? AND username = ? AND password = ?';
    connection.query(adminQuery, [id, usnm, pswd], (err, results) =>{
        if (err) {
            req.flash("error",'Error checking admin credentials');
            return res.redirect("/login");
        }
        if (results.length === 0) {
            req.flash("error", 'Unauthorized: Invalid credentials');
            return res.redirect("/login");
        }
        const empQuery = 'SELECT * FROM emplist';
        connection.query(empQuery, (err, empResults) =>{
            if (err) {
                req.flash("error", 'Error querying employee list');
                return res.redirect("/login");
            }
            res.render('./routes/AdminPage.ejs', { emplist: empResults });
        })
    })  
})

app.get("/login",(req,res)=>{
    res.render("./routes/loginAdmin.ejs");
})

app.get("/",indexController.showEmp);

app.all("*",(req,res,next)=>{
    next(new ExpressError(404,"Page Not Found"));
});

app.use((err,req,res,next)=>{
    let{statusCode=500,message="something went wrong"}=err;
    res.status(statusCode).render("error.ejs",{message});
});

app.listen(port,(req,res)=>{
    console.log("server is listening to port 8080");
})
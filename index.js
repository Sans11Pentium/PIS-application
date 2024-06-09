const mysql = require('mysql2');
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

app.engine("ejs",ejsMate);

app.set("view engine","ejs");
app.set("views",path.join(__dirname,"/views"));
app.use(express.static(path.join(__dirname,"public")));

app.use(methodOverride("_method"));
app.use(express.urlencoded({extended:true}));

const indexController = require("./controllers/index.js");

const port=8080;
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'drdo_pis',
    password:"sans",
    multipleStatements: true,
});

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
// app.use((req,res,next) => {
//     console.log(req.url);
//     console.log(req.originalMethod);
//     next();
// })

app.use((req,res,next)=>{
    res.locals.success = req.flash("success"); // store the flash msg in locals of response object
    res.locals.error = req.flash("error");
    // res.locals.currUser = req.user;
    next();
})

app.use("/bday", bdayRouter);
app.use("/retire", retireRouter);
app.use("/new-join", newJoinRouter);
app.use("/admin", adminRouter);

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
            res.redirect("loginAdmin.ejs",'Error checking admin credentials');
        }
        if (results.length === 0) {
            res.redirect("loginAdmin.ejs",'Unauthorized: Invalid credentials');
        }
        const empQuery = 'SELECT * FROM emplist';
        connection.query(empQuery, (err, empResults) =>{
            if (err) {
                return res.status(500).send('Error querying employee list');
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
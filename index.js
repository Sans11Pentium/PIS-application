const mysql = require('mysql2');
const express=require("express");
const app=express();
const path=require("path");
const ejsMate=require("ejs-mate");
const methodOverride=require("method-override");
session = require("express-session");
const flash = require("connect-flash");

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

app.use((req,res,next)=>{
    res.locals.success = req.flash("success"); // store the flash msg in locals of response object
    res.locals.error = req.flash("error");
    // res.locals.currUser = req.user;
    next();
})

app.post("/localhost:8080/new/admin/show",(req,res)=>{
    const { id, usnm, pswd } = req.body;
    res.redirect("https://localhost:8080/admin/signup");
})

app.post('/admin/show', (req, res) => {
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
        });
    });
})

app.get("/admin/signup",(req,res)=>{
    res.render("./routes/signupAdmin.ejs");
})

app.get("/admin",(req,res)=>{
    res.render("./routes/loginAdmin.ejs");
})

app.get("/",(req,res)=>{
    const q=`SELECT id,employee_id,first_name,middle_name,last_name,gender,job_title,work_phone,mobile_phone,work_email,department FROM EMPLOYEES;`;
    try{
        connection.query(q,(err,results)=>{
            if(err) throw err;
            const data=results;
            res.render("./routes/home.ejs", { data });
        });
        }
        catch(err){
            console.log(err);
            res.send("some error , plz try again!");
        }
})

app.use("/bday", bdayRouter);
app.use("/retire", retireRouter);
app.use("/new-join", newJoinRouter);
app.use("/admin", adminRouter);


app.listen(port,(req,res)=>{
    console.log("server is listening to port 8080");
});
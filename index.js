const mysql = require('mysql2');
const express=require("express");
const app=express();
const path=require("path");
const ejsMate=require("ejs-mate");
const methodOverride=require("method-override");

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


app.post("/localhost:8080/new/admin/show",(req,res)=>{
    const { id, usnm, pswd } = req.body;
    res.redirect("https://localhost:8080/admin/signup");
    //chk new admin details
    //verify and render adminpage
    // res.render("AdminPage.ejs");
})

// Define the /admin/show route
app.post('/admin/show', (req, res) => {
    const { id, usnm, pswd } = req.body; // Use req.body to get POST parameters

    // Query to check if the admin credentials match
    const adminQuery = 'SELECT * FROM adminpasswords WHERE id = ? AND username = ? AND password = ?';
    connection.query(adminQuery, [id, usnm, pswd], (err, results) =>{
        if (err) {
            res.redirect("loginAdmin.ejs",'Error checking admin credentials');
        }

        if (results.length === 0) {
            // No matching admin found
            res.redirect("loginAdmin.ejs",'Unauthorized: Invalid credentials');
        }

        // Admin credentials match, query emplist table
        const empQuery = 'SELECT * FROM emplist';
        connection.query(empQuery, (err, empResults) =>{
            if (err) {
                return res.status(500).send('Error querying employee list');
            }

            // Render AdminPage.ejs with employee list
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
            // Render the studentPage.ejs with the data object
            res.render("./routes/home.ejs", { data });
        });
        }
        catch(err){
            console.log(err);
            res.send("some error , plz try again!");
        }
    //console.log("home details showing");
})

app.get("/bday", (req, res) => {
    const today = new Date();
    const todayMonth = today.getMonth() + 1; // Months are zero-indexed, so add 1
    const todayDay = today.getDate();

    // console.log('Today:', todayMonth, todayDay);
    connection.query(`SELECT * FROM employees WHERE MONTH(birthday) = ? AND DAY(birthday) = ?`, 
        [todayMonth, todayDay], 
        (err, results) => {
            if (err) {
                console.error('Error executing MySQL query:', err);
                res.status(500).send('Internal Server Error');
                return;
            }
            // console.log('Query results:', results);
            res.render('./routes/bday.ejs', { employees: results });
        }
    );
})

app.get("/retire",(req,res)=>{
    const today = new Date();
    const todayMonth = today.getMonth() + 1; 
    const yr = today.getFullYear();
    
    connection.query(`SELECT * FROM employees WHERE MONTH(termination_date) = ? AND YEAR(termination_date) = ?`, 
        [todayMonth, yr], 
        (err, results) => {
            if (err) {
                console.error('Error executing MySQL query:', err);
                res.status(500).send('Internal Server Error');
                return;
            }
            res.render('./routes/retire.ejs', { employees: results });
        }
    );
})

app.get("/new-join",(req,res)=>{
    const today = new Date();
    const todayMonth = today.getMonth() + 1; 
    const yr = today.getFullYear();
    const todayDay = today.getDate();
    
    connection.query(`SELECT * FROM employees WHERE DAY(joined_date) AND MONTH(joined_date) = ? AND YEAR(joined_date) = ?`, 
        [todayDay, todayMonth, yr], 
        (err, results) => {
            if (err) {
                console.error('Error executing MySQL query:', err);
                res.status(500).send('Internal Server Error');
                return;
            }
            res.render('./routes/new-join.ejs', { employees: results });
        }
    );
})

app.get("/add",(req,res)=>{
    res.render("./routes/AdminAdd.ejs");
})

app.get("/edit",(req,res)=>{
    res.render("./routes/AdminEdit.ejs");
})

app.get("/delete",(req,res)=>{
    res.render("./routes/AdminDelete.ejs");
})

app.get("/addgrp",(req,res)=>{
    res.render("./routes/AdminAddGrp.ejs");
})

app.get("/correction",(req,res)=>{
    res.render("./routes/AdminEmpCorr.ejs");
})

app.listen(port,(req,res)=>{
    console.log("server is listening to port 8080");
});
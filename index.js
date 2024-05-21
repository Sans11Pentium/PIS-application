const mysql = require('mysql2');
const express=require("express");
const app=express();
const path=require("path");
const ejsMate=require("ejs-mate");
app.engine("ejs",ejsMate);

app.set("view engine","ejs");
app.set("views",path.join(__dirname,"/views"));
app.use(express.static(path.join(__dirname,"public")));
// app.use(express.static('public'));
//to run mysql service
//net start MySQL80
//run this in cmd (run as administrator)
//to start mysql in terminal
//& "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p
const methodOverride=require("method-override");

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
});
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
            res.render('AdminPage.ejs', { emplist: empResults });
        });
    });
});



app.get("/admin/signup",(req,res)=>{
    res.render("signupAdmin.ejs");
});
// app.get("/staff/signup",(req,res)=>{
//     res.render("signupStaff.ejs");
// });
// app.get("/staff",(req,res)=>{
//     res.render("loginStaff.ejs");
// });
app.get("/admin",(req,res)=>{
    res.render("loginAdmin.ejs");
});
app.get("/",(req,res)=>{
    const q=`SELECT id,employee_id,first_name,middle_name,last_name,gender,job_title,work_phone,mobile_phone,work_email,department FROM EMPLOYEES;`;
    try{
        connection.query(q,(err,results)=>{
            if(err) throw err;
            const data=results;
            // console.log(results);
            // Render the studentPage.ejs with the data object
            res.render("home.ejs", { data });
        });
        }
        catch(err){
            console.log(err);
            res.send("some error , plz try again!");
        }
    console.log("home details showing");
});
    // res.render("home.ejs");
// });
app.listen(port,(req,res)=>{
    console.log("server is listening to port 8080");
});
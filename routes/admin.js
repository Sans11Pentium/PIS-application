const express = require("express");
const router = express.Router();
const mysql = require('mysql2');
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'drdo_pis',
    password:"sans",
    multipleStatements: true,
});

//Add emp
router.get("/add",(req,res)=>{
    res.render("./routes/AdminAdd.ejs");
})

router.post("/add",(req,res) => {
    let new_emp = req.body.emp;
    console.log(new_emp);
    req.flash("success","Employee added successfully!");
    res.redirect("/add");
})

//edit emp details
router.get("/edit",(req,res)=>{
    res.render("./routes/AdminEdit.ejs");
})

router.put("/edit",(req,res) => {

})

//delete an employee
router.get("/delete",(req,res)=>{
    res.render("./routes/AdminDelete.ejs");
})

router.delete("/delete", (req, res) => {

})

//add a group
router.get("/addgrp",(req,res)=>{
    res.render("./routes/AdminAddGrp.ejs");
})

router.put("/addgrp", (req, res) => {

})

//emp correction
router.get("/correction",(req,res)=>{
    res.render("./routes/AdminEmpCorr.ejs");
})

router.put("/correction", (req, res) => {

})

module.exports = router;
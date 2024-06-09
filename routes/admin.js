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
const wrapAsync=require("../utils/wrapAsync.js");
const adminController = require("../controllers/admin.js");

//Add emp
router.get("/add",adminController.renderAddEmpForm)
router.post("/add",adminController.addEmp)

//edit emp details
//render the form about whose details are to be edited
router.get("/edit",adminController.renderEditForm)
//on the basis of is obtained from above form, give edit form for that emp's details
router.post("/edit", adminController.renderEditEmpDetails);
//submit the above form and make changes in db
router.put('/edit', adminController.editEmp);

//delete an employee
router.get("/delete",adminController.renderDeleteForm)
router.delete("/delete", adminController.deleteEmp)

//add a group
router.get("/addgrp",adminController.renderAddGrpForm)
router.post("/addgrp", adminController.addGrp);

//emp correction
router.get('/correction', adminController.getCorrections);

module.exports = router;
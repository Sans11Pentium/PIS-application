const express = require("express");
const router = express.Router();
const wrapAsync=require("../utils/wrapAsync.js");
const adminController = require("../controllers/admin.js");
const {userExists} = require("../middleware.js");
const passport = require("passport");

//Add emp
router.route("/add")
.get(adminController.renderAddEmpForm)
.post(adminController.addEmp)

//edit emp details
router.route("/edit")
.get(adminController.renderEditForm) //render the form about whose details are to be edited
.post(adminController.renderEditEmpDetails) //on the basis of is obtained from above form, give edit form for that emp's details
.put(adminController.editEmp); //submit the above form and make changes in db

//delete an employee
router.route("/delete")
.get(adminController.renderDeleteForm)
.delete(adminController.deleteEmp);

//add a group
router.route("/addgrp")
.get(adminController.renderAddGrpForm)
.post(adminController.addGrp);

//emp correction
router.route("/correction/:id")
.get(adminController.makeCorrection);

router.route("/correction")
.get(adminController.getCorrections);

router.route("/login")
.get(adminController.getAdminLoginForm)
.post(passport.authenticate(
    'local',
    {
        failureRedirect:'/admin/login-failure',
        failureFlash: true,
    }),
    adminController.adminLogin
);

router.route("/signup")
.get(adminController.getAdminSignupForm)
.post(userExists, adminController.adminSignup);

router.route("/logout")
.get(adminController.adminLogout);

router.route('/login-failure')
.get(adminController.adminLoginFailure)

module.exports = router;
const express = require("express");
const router = express.Router();
const wrapAsync = require("../utils/wrapAsync.js");
const adminController = require("../controllers/admin.js");
const { userExists } = require("../middleware.js");
const passport = require("passport");

// Add employee
router.route("/add")
    .get(adminController.renderAddEmpForm)
    .post(wrapAsync(adminController.addEmp));

// Edit employee details
router.route("/edit")
    .get(adminController.renderEditForm)
    .post(wrapAsync(adminController.renderEditEmpDetails))
    .put(wrapAsync(adminController.editEmp));

// Delete an employee
router.route("/delete")
    .get(adminController.renderDeleteForm)
    .delete(wrapAsync(adminController.deleteEmp));

// Add a group
router.route("/addgrp")
    .get(adminController.renderAddGrpForm)
    .post(wrapAsync(adminController.addGrp));

// Employee correction
router.route("/correction/:id")
    .get(wrapAsync(adminController.makeCorrection));

router.route("/correction")
    .get(wrapAsync(adminController.getCorrections));

// Admin login
router.route("/login")
    .get(adminController.getAdminLoginForm)
    .post(passport.authenticate(
        'local',
        {
            failureRedirect: '/admin/login-failure',
            failureFlash: true,
        }
    ), wrapAsync(adminController.adminLogin));

// Admin signup
router.route("/signup")
    .get(adminController.getAdminSignupForm)
    .post(userExists, wrapAsync(adminController.adminSignup));

// Admin logout
router.route("/logout")
    .get(adminController.adminLogout);

// Login failure
router.route('/login-failure')
    .get(adminController.adminLoginFailure);

module.exports = router;

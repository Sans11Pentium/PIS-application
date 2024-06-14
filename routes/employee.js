const express = require("express");
const router = express.Router();
const wrapAsync=require("../utils/wrapAsync.js");
const empController = require("../controllers/employee.js");
const { editEmp } = require("../controllers/admin.js");

router.route("/show")
.post(empController.showEmpDetails);

router.route("/correct")
.post(empController.makeCorrection);

module.exports = router;
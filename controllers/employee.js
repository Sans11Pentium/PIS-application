const connection = require("../routes/dbConnect");

//verify password to get emp details
module.exports.showEmpDetails = (req,res) => {
    const data = req.body.employee;
    //console.log(data);
    //show account details and active correction requests
    const empid = data.employee_id;
    let query1 = "SELECT * FROM empcorrections where employee_id = ? and isUpdate = 0";
    let query2 = "SELECT * FROM empcorrections where employee_id = ? and isUpdate = 1";
    connection.query(query1, [empid], (error, results) => {
        if (error) {
            console.error(error);
            req.flash("error", "Error retrieving corrections. Please try later.");
            return res.render("/emp/show", {data, results : {}});
        }else{
            //console.log(results);
            res.render("./routes/employeePage.ejs",{data, results: results});
        }
    })
}

//accept a form to make correction request
module.exports.makeCorrection = (req, res) => {
    let data = req.body.emp;
    //console.log(data);
    const query = "INSERT INTO empcorrections (employee_id, correction_required, date, isUpdate) VALUES (?, ?, NOW(), 0);"
    connection.query(query, [data.empid, data.msg], (error, results) => {
        if (error) {
            console.error(error);
            req.flash("error", "Error adding correction. Please try again.");
            return res.redirect("/emp/show");
        }
        req.flash("success", "Correction added successfully! Wait till admin resolves it");
        res.redirect("/");
    });
}
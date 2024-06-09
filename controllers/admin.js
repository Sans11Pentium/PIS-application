const mysql = require('mysql2');
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'drdo_pis',
    password:"sans",
    multipleStatements: true,
});

//add emp
//GET
module.exports.renderAddEmpForm = (req,res)=>{
    res.render("./routes/AdminAdd.ejs");
}
//POST
module.exports.addEmp = (req,res) => {
    let new_emp = req.body.emp;
    connection.query('INSERT INTO employees SET ?', new_emp, (error, results) => {
        if (error) {
            console.error(error);
            if(error.errno==1062){
                req.flash("error","Employee already exists. Edit details of this employee instead");
                return res.redirect("/admin/add");
            }
            req.flash("error","Status 500 Server Error");
            return res.redirect("/admin/add");
        }else{
            req.flash("success","Employee added successfully!");
            return res.redirect("/admin/add");
        }
    });
}

//Edit emp
// GET
module.exports.renderEditForm = (req,res)=>{
    res.render("./routes/editForm.ejs");
}
//POST
module.exports.renderEditEmpDetails = (req, res) => {
    connection.query('SELECT * FROM employees WHERE id = ? AND employee_id=?', [req.body.emp.id, req.body.emp.employee_id], (error, results) => {
        if (error) {
            console.error(error);
            req.flash("error","Status 500 Server Error");
            return res.redirect("/admin/edit");
        }
        const employee = results[0];
        if (!employee) {
            req.flash("error","Employee not found");
            return res.redirect("/admin/edit");
        }
        req.flash("sucess","Here are the details for you to edit!");
        res.render("./routes/AdminEdit.ejs", { employee });
    });
}
// PUT
module.exports.editEmp = (req, res) => {
    const emp = req.body.emp;
    const empId = emp.id;
    // Ensure joined_date is a single value
    if (Array.isArray(emp.joined_date)) {
        emp.joined_date = emp.joined_date[0];
    }
    //allowed to be updated
    const allowedFields = [
        'id', 'employee_id', 'first_name', 'middle_name', 'last_name', 'nationality',
        'birthday', 'Gender', 'marital_status', 'ssn_num', 'nic_num', 'other_ID',
        'driving_license', 'driving_license_exp_date', 'employment_status', 'job_title',
        'pay_grade', 'work_station_id', 'address1', 'address2', 'city', 'country',
        'province', 'postal_code', 'home_phone', 'mobile_phone', 'work_phone',
        'work_email', 'private_email', 'joined_date', 'confirmation_date',
        'supervisor', 'indirect_supervisors', 'department', 'custom1', 'custom2',
        'custom3', 'custom4', 'custom5', 'custom6', 'custom7', 'custom8', 'custom9',
        'custom10', 'termination_date', 'notes', 'status', 'ethnicity', 'immigration_status',
        'approver1', 'approver2', 'approver3', 'cadre', 'dopr', 'posting_place', 'image_path',
        'remarks', 'lastUpdated', 'additional_charge1', 'additional_charge2',
        'additional_charge3', 'AdditionalMember'
    ];
    // Filter the fields to be updated
    const fieldsToUpdate = {};
    allowedFields.forEach(field => {
        if (field in emp) {
            fieldsToUpdate[field] = emp[field];
        }
    });
    // Check if fieldsToUpdate is not empty
    if (Object.keys(fieldsToUpdate).length === 0) {
        req.flash('error', 'No valid fields to update');
        return res.redirect('back');
    }
    const sql = `UPDATE employees SET ${Object.keys(fieldsToUpdate).map(field => `\`${field}\` = ?`).join(', ')} WHERE id = ?`;
    const values = [...Object.values(fieldsToUpdate), empId];

    connection.query(sql, values, (err, result) => {
        if (err) {
            console.error('Error updating employee details:', err);
            req.flash('error', 'Error updating employee details');
            return res.redirect('back');
        }
        req.flash('success', 'Employee details updated successfully');
        res.redirect('back');
    });
}

// Delete emp
//GET
module.exports.renderDeleteForm = (req,res)=>{
    res.render("./routes/AdminDelete.ejs");
}
//DELETE
module.exports.deleteEmp = (req, res) => {
    const id = req.body.emp.id;

    connection.query('SELECT * FROM employees WHERE id = ?', [id], (error, results) => {
        if (error) {
            console.error(error);
            req.flash("error", "Server error. Please try again.");
            return res.redirect("/admin/delete");
        }
        if (results.length === 0) {
            req.flash("error", "Id not found, enter a valid one");
            return res.redirect("/admin/delete");
        }

        connection.query('DELETE FROM employees WHERE id = ?', [id], (deleteError, deleteResults) => {
            if (deleteError) {
                console.error(deleteError);
                req.flash("error", "Server error. Please try again.");
                return res.redirect("/admin/delete");
            }
            console.log({ deleteResults });
            req.flash("success", "Employee deleted successfully!");
            res.redirect("/admin/delete");
        });
    });
}

//Add Grp
//GET
module.exports.renderAddGrpForm = (req,res)=>{
    res.render("./routes/AdminAddGrp.ejs");
}
//POST
module.exports.addGrp = (req, res) => {
    const { id, title, description, address, type, country, parent, timezone, heads, GO, DO, TD, OIC } = req.body;
    const groupData = {
        id,
        title,
        description,
        address,
        type,
        country,
        parent,
        timezone,
        heads,
        GO,
        DO,
        TD,
        OIC
    };

    connection.query('INSERT INTO companystructures SET ?', groupData, (error, results) => {
        if (error) {
            console.error(error);
            req.flash("error", "Error adding group. Please try again.");
            return res.redirect("/admin/addgrp");
        }
        req.flash("success", "Group added successfully!");
        res.redirect("/admin/addgrp");
    });
}

//corrections emp
//GET
module.exports.getCorrections = (req, res) => {
    const query = 'SELECT * FROM empcorrections WHERE isUpdate = 0'; // Assuming isUpdate = 0 means corrections are needed

    connection.query(query, (error, results) => {
        if (error) {
            console.error('Error fetching employees needing correction:', error);
            req.flash('error', 'Failed to load corrections.');
            return res.redirect('/admin');
        }
        res.render('./routes/AdminEmpCorr.ejs', { corrections: results });
    });
}
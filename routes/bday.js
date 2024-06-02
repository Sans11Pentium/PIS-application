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

router.get("/", (req, res) => {
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

module.exports = router;
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

router.get("/",(req,res)=>{
    const today = new Date();
    const todayMonth = today.getMonth() + 1; 
    const yr = today.getFullYear();
    
    connection.query(`SELECT * FROM employees WHERE MONTH(joined_date) = ? AND YEAR(joined_date) = ?`, 
        [todayMonth, yr], 
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

module.exports = router;
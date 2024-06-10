const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'drdo_pis',
    password: process.env.DB_PASSWORD,
    multipleStatements: true,
});

module.exports = connection;
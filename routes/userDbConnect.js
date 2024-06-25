const mysql = require('mysql2');

var userConnection = mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "user",
    password: "sans",
    multipleStatements: true,
});
userConnection.connect((err) => {
    if (!err) {
        console.log("Connected");
    } else {
        console.log("Conection Failed", err);
    }
});

module.exports = userConnection;
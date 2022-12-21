var mysql = require('mysql');
var serverAccess = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "123456789",
    database: "pcmaker",
})

module.exports = serverAccess;
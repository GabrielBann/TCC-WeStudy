const mysql = require('mysql2')

const connection = mysql.createPool({
    host: "localhost",
    password: "root",
    user: "root",
    database: "WeStudy"
})

module.exports = connection
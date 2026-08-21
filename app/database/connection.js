import mysql from 'mysql2/promise'

const connection = mysql.createPool({
    host: "localhost",
    password: "root",
    user: "root",
    database: "WeStudy"
})

export default connection
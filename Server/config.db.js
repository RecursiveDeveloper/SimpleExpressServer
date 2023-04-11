const dotenv = require("dotenv");
dotenv.config();

const mysql = require('mysql2');
let connection;

try {
    connection = mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASS,
        database: process.env.DB_NAME,
        port: process.env.DB_LOCAL_PORT
    });

    connection.connect(function(err) {
        if (err) throw err;
        console.log('Connected to the MySQL server.');
    });
} catch (error) {
    console.log("Error al conectar con la base de datos");
}

module.exports = {connection};
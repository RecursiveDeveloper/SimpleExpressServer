const express = require("express");
const app = express();

const dotenv = require("dotenv");
dotenv.config();

//conexión con la base de datos
const {connection} = require("../config.db");

const getCarta = (request, response) => {
    connection.query("SELECT * FROM manager", 
    (error, results) => {
        if(error)
            throw error;
        response.status(200).json(results);
    });
};
//ruta
app.route("/manager")
.get(getCarta);

const postCarta = (request, response) => {
    const {manager_id, first_name, last_name, last_update} = request.body;
    connection.query(
        `INSERT INTO manager
        (plato, descripcion, precio, disponible) 
        VALUES 
        (?,?,?,?) `, 
        [manager_id, first_name, last_name, last_update],
    (error, results) => {
        if(error)
            throw error;
        response.status(201).json({"Item añadido correctamente": results.affectedRows});
    });
};
//ruta
app.route("/manager")
.post(postCarta);


const delCarta = (request, response) => {
    const id = request.params.id;
    connection.query("Delete from manager where manager_id = ?", 
    [id],
    (error, results) => {
        if(error)
            throw error;
        response.status(201).json({"Item eliminado":results.affectedRows});
    });
};
//ruta
app.route("/manager/:id")
.delete(delCarta);

module.exports = app;

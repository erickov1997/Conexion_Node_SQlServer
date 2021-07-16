const express = require('express');
const app = express.Router();

const mssql = require('mssql');
const db = require('../keys');

app.post('/products', async (req, res) => {
    try {
        const { nombre, fecha_caducidad, precio } = req.body;
        let pool = await mssql.connect(db);
        await pool.query(`insert into Producto values ('${nombre}','${fecha_caducidad}','${precio}')`);
        res.json(req.body);
    } catch (error) {
        console.error('Ha ocurrido un error');
    }
});

app.post('/ciudad',async (req,res)=>{
    let {nombre} = req.body;
    let pool= await mssql.connect(db);
    await pool.request().query(`INSERT INTO Tienda VALUES('${nombre}')`);
    res.json(req.body);
});


app.get('/products', async (req, res) => {
    try {
        let pool = await mssql.connect(db);
        let tiendas = await pool.request().query('SELECT * FROM Tienda');
        res.json(tiendas.recordsets);
    } catch (err) {
        res.send('Ha ocurrido un error')
    }

});

app.get('/products/:id', async (req, res) => {
    try {

        const id = req.params.id;
        let pool = await mssql.connect(db);
        let producto = await pool.query(`SELECT * FROM Producto WHERE id =${id}`);
        console.log(producto.recordsets);

        res.json(producto.recordsets[0]);


    } catch (error) {
        res.send("Ha ocurrido un error");
    }

});




module.exports = app;
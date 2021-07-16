const express= require('express');
const morgan = require('morgan');
const cors=require('cors');

 const app=express();
 app.use(cors());
 app.set('port', process.env.PORT || 3008);

 app.use(express.json());

 app.use(morgan('dev'));

 app.use(require('./routes/links'));

 const server =app.listen(app.get('port'),()=>{
     console.log('Aplicación en el puerto', app.get('port'))
 })
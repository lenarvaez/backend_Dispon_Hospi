const express = require('express');
const morgan = require('morgan');
const mysql = require('mysql');
const myConnection = require('express-myconnection');

const app = express();

// Importing routes
const evaluatedRoutes = require('./routes/evaluated');

// Settings
app.set('port', process.env.PORT || 3000);

// Middlewares
app.use(morgan('dev'));
app.use(myConnection(mysql, {
    host: 'localhost', 
    user: 'root',
    password: '',
    port: 3306,
    database: 'app-msp'
}, 'single'))
app.use(express.urlencoded({extended: true}));

// routes
app.use('/', evaluatedRoutes);

// Starting server
app.listen(app.get('port'), ()=> {
    console.log('Server on port 3000');
});
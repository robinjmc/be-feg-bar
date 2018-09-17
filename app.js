process.env.NODE_ENV =  process.env.NODE_ENV || 'dev';

const express = require('express');
const app = express();
const {json} = require('body-parser');
const api = require('./routes/api');
const cors = require('cors');

app.use(cors());

app.use(json());

// app.set('view engine', 'ejs');

app.get('/api', (req, res) => res.status(200).send('All good!'));

app.use('/api', api);

app.use(express.static('./view'));

app.get('/',function(req,res){
    res.sendFile('index.html');
  });

app.use((err, req, res, next) => {
    console.log('error', JSON.stringify(err, null, 2))
    console.log(err.message)
    if(err.status === 400 || /Failing row contains/g.test(err.detail)) return res.status(400).send({message: 'Bad Request'});
    if(err.status === 404 || err.status === 501 || /is not present in table/g.test(err.detail) || err.message === 'No data returned from the query.') {
        console.log('not found', res.status)
        return res.status(404).send({message: 'Not Found'})
        //return res.status(err.status).send({message: 'Not Found'})
    };
    next();
})

module.exports = app;

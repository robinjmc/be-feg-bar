if (process.env.NODE_ENV !== 'test') process.env.NODE_ENV = 'dev';
const app = require('express')();
const {json} = require('body-parser');
const api = require('./routes/api');

app.use(json());

// app.set('view engine', 'ejs');

app.get('/api', (req, res) => res.status(200).send('All good!'));

app.use('/api', api);

app.use((err, req, res, next) => {
    console.log('error', JSON.stringify(err, null, 2))
    if(err.status === 400 || err.name === 'CastError' || err.name === 'ValidationError') return res.status(400).send({message: 'Bad Request'});
    if(err.status === 404 || err.status === 501 || err.name === 'TypeError') return res.status(err.status).send({message: 'Not Found'});
    next();
})

module.exports = app;
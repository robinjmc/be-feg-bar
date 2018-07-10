if (process.env.NODE_ENV !== 'test') process.env.NODE_ENV = 'dev';
const app = require('express')();
const {json} = require('body-parser');
const api = require('./routes/api');

app.use(json());

app.set('view engine', 'ejs');

app.get('/api', (req, res) => {
    res.json({status: 'OK'});
});

app.use('/api', api);
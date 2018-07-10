const express = require('express');
const {feggies, feg_types, months} = require('./index')

const router = express.Router();

router.use('/feggies', feggies);

router.use('/feg_types', feg_types);

router.use('/months', months);

module.exports = router;
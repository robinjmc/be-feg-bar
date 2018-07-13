const express = require('express');
const {feggies, feg_types, months, feg_list} = require('./index')

const router = express.Router();

router.use('/feggies', feggies);

router.use('/feg_types', feg_types);

router.use('/months', months);

router.use('/feg_list', feg_list)

module.exports = router;
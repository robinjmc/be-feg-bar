const router = require('express').Router();
const {feggies: {getAll}} = require('../controllers');

router.get('/', getAll);

module.exports = router;
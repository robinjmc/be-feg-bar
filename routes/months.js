const router = require('express').Router();
const {months: {getAll}} = require('../controllers');

router.get('/', getAll);

module.exports = router;
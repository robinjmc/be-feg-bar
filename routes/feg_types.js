const router = require('express').Router();
const {feg_types: {getAll}} = require('../controllers');

router.get('/', getAll);

module.exports = router;
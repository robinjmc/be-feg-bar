const router = require('express').Router();
const {feg_types: {getAll, getByType}} = require('../controllers');

router.get('/', getAll);

router.get('/:id', getByType);

module.exports = router;
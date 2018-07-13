const router = require('express').Router();
const {feggies: {getAll, getInSeasonMonths, getById}} = require('../controllers');

router.get('/', getAll);

router.get('/:feg_id/:in_season', getInSeasonMonths)

router.get('/:id', getById)

module.exports = router;
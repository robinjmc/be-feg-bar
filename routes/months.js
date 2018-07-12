const router = require('express').Router();
const {months: {getAll, getInSeason}} = require('../controllers');

router.get('/', getAll);

router.get('/:month_id/:in_season', getInSeason)

module.exports = router;
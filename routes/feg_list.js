const router = require('express').Router();
const {feg_list: {getList, addFegToList}} = require('../controllers');

router.get('/', getList);

router.post('/:feg_id', addFegToList);

module.exports = router;
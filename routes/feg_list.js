const router = require('express').Router();
const {feg_list: {getList, addFegToList, amount, removeFeg}} = require('../controllers');

router.get('/', getList);

router.post('/:feg_id', addFegToList);

router.put('/:feg_list_id', amount)

router.delete('/:feg_list_id', removeFeg)

module.exports = router;
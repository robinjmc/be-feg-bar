const db = require(`../db`)

module.exports = {
    getList(req, res, next){
        db.manyOrNone('SELECT * FROM feg_list')
                .then((feg_list) => {
                    res.send({feg_list});
                })
                .catch(next);
    },
    addFegToList(req, res, next){
    
    }
}
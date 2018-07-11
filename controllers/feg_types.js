const db = require(`../db`)

module.exports = {
    getAll(req, res){
        db.manyOrNone('SELECT * FROM feg_types')
                .then((feg_types) => {
                    res.send({feg_types});
                });
    }
}
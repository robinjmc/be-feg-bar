const db = require(`../db/config.${process.env.NODE_ENV}.js`)

module.exports = {
    getAll(req, res){
        db.manyOrNone('SELECT * FROM feg_types')
                .then((feg_types) => {
                    res.send({feg_types});
                });
    }
}
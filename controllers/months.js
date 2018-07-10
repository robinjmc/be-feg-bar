const db = require(`../db/config.${process.env.NODE_ENV}.js`)

module.exports = {
    getAll(req, res){
        db.manyOrNone('SELECT * FROM months')
                .then((months) => {
                    res.send({months});
                });
    }
}
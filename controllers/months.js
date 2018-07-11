const db = require(`../db`)

module.exports = {
    getAll(req, res){
        db.manyOrNone('SELECT * FROM months')
                .then((months) => {
                    res.send({months});
                });
    }
}
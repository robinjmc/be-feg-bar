const db = require(`../db/config.${process.env.NODE_ENV}.js`)

module.exports = {
    getAll(req, res, next){
        db.manyOrNone('SELECT * FROM feggies')
                .then((feggies) => res.send({feggies}))
                .catch(console.log)
    }
}
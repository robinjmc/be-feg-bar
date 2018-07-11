const db = require(`../db`)

module.exports = {
    
    getAll(req, res){
        db.manyOrNone('SELECT * FROM feggies')
                .then((feggies) => res.send({feggies}))
                .catch(console.log)
    }
}
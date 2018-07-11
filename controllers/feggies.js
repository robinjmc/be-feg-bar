const db = require(`../db`)

module.exports = {
    
    getAll(req, res){
        console.log(db)
        db.manyOrNone('SELECT * FROM feggies')
                .then((feggies) => res.send({feggies}))
                .catch(console.log)
    }
}
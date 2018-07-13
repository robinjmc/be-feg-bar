const db = require(`../db`)

module.exports = {
    getAll(req, res, next){
        db.manyOrNone('SELECT * FROM feg_types')
                .then((feg_types) => {
                    res.send({feg_types});
                })
                .catch(next);
    },
    getByType(req, res){
        const id = req.params.id
        db.manyOrNone(`SELECT * FROM feggies RIGHT JOIN feg_types ON feggies.feg_type_id = feg_types.feg_types_id WHERE feggies.feg_type_id = ${id}`)
            .then((feg_types) => {
                res.send({feg_types})
            })
            .catch(next);
    }
}
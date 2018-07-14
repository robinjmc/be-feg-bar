const db = require(`../db`)

module.exports = {
    getAll(req, res, next){
        db.manyOrNone('SELECT * FROM feg_types')
                .then((feg_types) => {
                    res.send({feg_types});
                })
                .catch(next);
    },
    getByType(req, res, next){
        const id = req.params.id
        console.log(!id.match(/\d/), id)
        if(!id.match(/\d/)) throw { status: 400 }
        db.manyOrNone(`SELECT * FROM feggies RIGHT JOIN feg_types ON feggies.feg_type_id = feg_types.feg_types_id WHERE feggies.feg_type_id = ${id}`)
            .then((feg_types) => {
                if (!feg_types[0]) throw { status: 404 }
                res.send({feg_types})
            })
            .catch(next);
    }
}
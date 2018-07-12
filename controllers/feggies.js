const db = require(`../db`)

module.exports = {
    getAll(req, res) {
        db.manyOrNone('SELECT * FROM feggies')
            .then((feggies) => res.send({ feggies }))
            .catch(console.log)
    },
    getInSeasonMonths({ params }, res) {
        const {  feg_id, in_season } = params
        console.log(in_season, feg_id)
        db.manyOrNone(`SELECT * FROM ${in_season} JOIN feggies ON ${in_season}.feggie_id = feggies.feggies_id JOIN months ON ${in_season}.month_id = months.months_id WHERE feggies.feggies_id = ${feg_id};`)
            .then((feggies) => res.send({ feggies }))
            .catch(console.log)
    },
    getById({ params }, res) {
        const {id} = params
        console.log(id)
        db.oneOrNone(`SELECT * FROM feggies WHERE feggies.feggies_id = ${id};`)
            .then((feggie) => res.send({ feggie }))
            .catch(console.log)
    }
}
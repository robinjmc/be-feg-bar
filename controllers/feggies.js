const db = require(`../db`)

module.exports = {
    getAll(req, res, next) {
        db.manyOrNone('SELECT * FROM feggies')
            .then((feggies) => res.send({ feggies }))
            .catch(next)
    },
    getInSeasonMonths({ params }, res, next) {
        const {  feg_id, in_season } = params
        console.log(!feg_id.match(/\d/), feg_id, in_season)
        if(!feg_id.match(/\d/)) throw { status: 400 }
        db.manyOrNone(`SELECT * FROM ${in_season} JOIN feggies ON ${in_season}.feggie_id = feggies.feggies_id JOIN months ON ${in_season}.month_id = months.months_id WHERE feggies.feggies_id = ${feg_id};`)
            .then((feggies) => {
                if (!feggies.length) throw { status: 404 }
                //if (typeof feggies === undefined) throw { status: 404 }
                res.send({ feggies })
            })
            .catch(next)
    },
    getById({ params }, res, next) {
        const {id} = params
        if(!id.match(/\d/)) throw { status: 400 }
        db.oneOrNone(`SELECT * FROM feggies WHERE feggies.feggies_id = ${id};`)
            .then((feggie) => {
                if (!feggie) throw { status: 404 }
                res.send({ feggie })
            })
            .catch(next)
    }
}
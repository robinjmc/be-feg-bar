const db = require(`../db`)

module.exports = {
    getAll(req, res, next) {
        db.manyOrNone('SELECT * FROM months')
            .then((months) => res.send({ months }))
            .catch(next);
    },
    getInSeason({ params }, res, next) {
        const { month_id, in_season } = params
        if(!month_id.match(/\d/)) throw { status: 400 }
        db.manyOrNone(`SELECT * FROM ${in_season} JOIN feggies ON ${in_season}.feggie_id = feggies.feggies_id JOIN months ON ${in_season}.month_id = months.months_id WHERE months.months_id = ${month_id};`)
            .then((feggies) => {
                const [test] = feggies
                if (!test) throw { status: 404 }
                res.send({ feggies })
            })
            .catch(next)
    }
}
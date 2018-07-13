const db = require(`../db`)

module.exports = {
    getAll(req, res) {
        db.manyOrNone('SELECT * FROM months')
            .then((months) => res.send({ months }))
            .catch(next);
    },
    getInSeason({ params }, res) {
        const { month_id, in_season } = params
        console.log(in_season, month_id)
        db.manyOrNone(`SELECT * FROM ${in_season} JOIN feggies ON ${in_season}.feggie_id = feggies.feggies_id JOIN months ON ${in_season}.month_id = months.months_id WHERE months.months_id = ${month_id};`)
            .then((feggies) => res.send({ feggies }))
            .catch(next)
    }
}
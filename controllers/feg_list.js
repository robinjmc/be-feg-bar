const db = require(`../db`)

module.exports = {
    getList(req, res, next) {
        db.manyOrNone('SELECT * FROM feg_list')
            .then((feg_list) => {
                res.send({ feg_list });
            })
            .catch(next);
    },
    addFegToList(req, res, next) {
        const { feggie_id, feg_name, img_src, amount } = req.body;
        const { feg_id } = req.params;
        if ( feg_id !== feggie_id) throw { status: 400 }
        db.one('INSERT INTO feg_list (feggie_id, feg_name, img_src, amount) VALUES ($1, $2, $3, $4) RETURNING *', [feggie_id, feg_name, img_src, amount])
            .then((feggie) => {
                res.status(201).send({ feggie })
            })
            .catch(next);
    }
}
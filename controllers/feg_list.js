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
        const { feggie_id, feg_name, img_src } = req.body;
        db.one('INSERT INTO feg_list (feggie_id, feg_name, img_src) VALUES ($1, $2, $3) returning *', [feggie_id, feg_name, img_src])
            .then((feggie) => {
                res.status(201).send({ feggie })
            })
            .catch(next);
    }
}
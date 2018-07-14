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
        if (feg_id !== feggie_id) throw { status: 400 }
        db.one('INSERT INTO feg_list (feggie_id, feg_name, img_src, amount) VALUES ($1, $2, $3, $4) RETURNING *', [feggie_id, feg_name, img_src, amount])
            .then((feggie) => {
                console.log('feggie')
                res.status(201).send({ feggie })
            })
            .catch(next);
    },
    amount(req, res, next) {
        const { feg_list_id } = req.params
        const { amount } = req.query
        if(!feg_list_id.match(/\d/)) throw { status: 400 }
        if (amount === 'up') {
            return db.one(`UPDATE feg_list SET amount = amount + 1 WHERE feg_list_id = $1 RETURNING *`, [feg_list_id])
                .then((feg_list) => {
                    res.status(201).send({ feg_list });
                })
                .catch(next);
        }
        else if (amount === 'down') {
            return db.one(`UPDATE feg_list SET amount = amount - 1 WHERE feg_list_id = $1 RETURNING *`, [feg_list_id])
                .then((feg_list) => {
                    res.status(201).send({ feg_list });
                })
                .catch(next)
        } 
        else {
            throw { status: 400 }
        }
        //const num = req.query.amount === 'up' ? 1 : req.query.amount === 'down' ? -1 : 0;

    }
}
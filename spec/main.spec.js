process.env.NODE_ENV = 'test';

const { expect } = require('chai');
const app = require('../app');
const request = require('supertest')(app)

describe('API', () => {
    describe('/api', () => {
        describe('/feg_types', () => {
            it('GET all feg_types', () => {
                return request
                    .get('/api/feg_types')
                    .expect(200)
                    .then(({ body: { feg_types } }) => {
                        expect(feg_types).to.be.an('array')
                        expect(feg_types[0]).to.be.an('object')
                        expect(feg_types[0].feg_type_name).to.equal('Vegetable')
                        expect(feg_types[1].slug).to.equal('fruit')
                    })
            })
            it('GET all feggies by type', () => {
                return request
                    .get('/api/feg_types/2')
                    .expect(200)
                    .then(({ body: { feg_types } }) => {
                        expect(feg_types).to.be.an('array')
                        expect(feg_types[12]).to.be.an('object')
                        expect(feg_types[10].feg_type_name).to.equal('Fruit')
                        expect(feg_types[9].slug).to.equal('fruit')
                        expect(feg_types[4].name).to.equal('cranberry')
                    })
            })
        })
        describe('/months', () => {
            it('GET all months', () => {
                return request
                    .get('/api/months')
                    .expect(200)
                    .then(({ body: { months } }) => {
                        expect(months).to.be.an('array')
                        expect(months[0]).to.be.an('object')
                        expect(months[0].month_name).to.equal('January')
                        expect(months[10].slug).to.equal('nov')
                    })
            })
            it('GET all feggies by month (coming_in)', () => {
                return request
                    .get(`/api/months/${6}/coming_in`)
                    .expect(200)
                    .then(({ body: { feggies } }) => {
                        expect(feggies).to.be.an('array')
                        expect(feggies[0]).to.be.an('object')
                        expect(feggies[0].name).to.equal('cavolo_nero')
                        expect(feggies[1].month_name).to.equal('June')
                        expect(feggies[2].coming_in_id).to.equal(21)
                    })
            })
            it('GET all feggies by month (at_best)', () => {
                return request
                    .get(`/api/months/${7}/at_best`)
                    .expect(200)
                    .then(({ body: { feggies } }) => {
                        expect(feggies).to.be.an('array')
                        expect(feggies[0]).to.be.an('object')
                        expect(feggies[0].name).to.equal('aubergine')
                        expect(feggies[1].month_name).to.equal('July')
                        expect(feggies[2].at_best_id).to.equal(20)
                    })
            })
        })
        describe('/feggies', () => {
            it('GET all feggies', () => {
                return request
                    .get('/api/feggies')
                    .expect(200)
                    .then(({ body: { feggies } }) => {
                        expect(feggies).to.be.an('array')
                        expect(feggies[0]).to.be.an('object')
                        expect(feggies[5].name).to.equal('celery')
                        expect(feggies[32].feg_type_id).to.equal(2)
                    })
            })
            it('GET feggie by id', () => {
                return request
                    .get('/api/feggies/1')
                    .expect(200)
                    .then(({ body: { feggie } }) => {
                        expect(feggie).to.be.an('object')
                        expect(feggie.feggies_id).to.equal(1)
                        expect(feggie.name).to.equal('aubergine')
                    })
            })
            it('GET feggie season by id (coming_in)', () => {
                return request
                    .get(`/api/feggies/${1}/coming_in`)
                    .expect(200)
                    .then(({ body: { feggies } }) => {
                        expect(feggies).to.be.an('array')
                        expect(feggies[0]).to.be.an('object')
                        expect(feggies[0].name).to.equal('aubergine')
                        expect(feggies[0].slug).to.equal('may')
                    })
            })
            it('GET feggie season by id (at_best)', () => {
                return request
                    .get(`/api/feggies/${7}/at_best`)
                    .expect(200)
                    .then(({ body: { feggies } }) => {
                        expect(feggies).to.be.an('array')
                        expect(feggies[0]).to.be.an('object')
                        expect(feggies[3].name).to.equal('courgette')
                        expect(feggies[2].slug).to.equal('aug')
                    })
            })
        })
        describe('/feg_list', () => {
            it('GET all feg in list', () => {
                return request
                    .get('/api/feg_list')
                    .expect(200)
                    .then(({ body: { feg_list } }) => {
                        expect(feg_list).to.be.an('array')
                        expect(feg_list.length).to.equal(0)
                    })
            })
            it('POST a feg in list', () => {
                return request
                    .post('/api/feg_list/1')
                    .send({
                        "feggie_id": "1",
                        "feg_name": "aubergine",
                        "img_src": "https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d"
                    })
                    .expect(201)
                    .then(({ body: { feggie } }) => {
                        expect(feggie).to.be.an('object')
                        expect(feggie).to.eql({
                            'feg_list_id': 1,
                            'feggie_id': 1,
                            'feg_name': 'aubergine',
                            'img_src': 'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d',
                            'amount': 1
                        })
                    })
            })
            it('POST same feg twice in list increments the amount', () => {
                // const amount = 0
                return request
                    .post('/api/feg_list/5')
                    .send({
                        "feggie_id": "5",
                        "feg_name": "cavolo_nero",
                        "img_src": "https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d"
                        // "amount": `${amount}`
                    })
                    .expect(201)
                    .then(({ body: {feggie} }) => {
                        return request
                            .post('/api/feg_list/5')
                            .send({
                                "feggie_id": `${feggie.feggie_id}`,
                                "feg_name": `${feggie.feg_name}`,
                                "img_src": "https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d"
                                // "amount": `${feggie.amount}`
                            })
                            .expect(201)
                    })
                    .then(({ body: {feggie}  }) => {
                        expect(feggie.amount).to.equal(2)
                    })
            })
            it('PUT the amount of feg in list (up)', () => {
                return request
                    .post('/api/feg_list/2')
                    .send({
                        "feggie_id": "2",
                        "feg_name": "beetroot",
                        "img_src": "https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d"
                    })
                    .expect(201)
                    .then(({ body: { feggie } }) => {
                        return request
                            .put(`/api/feg_list/${feggie.feg_list_id}?amount=up`)
                            .expect(201)
                            .then(({ body: { feg_list } }) => {
                                expect(feg_list).to.be.an('object')
                                expect(feg_list.feggie_id).to.equal(2)
                                expect(feg_list.amount).to.equal(2)
                            })
                    })
            })
            it('PUT the amount of feg in list (down)', () => {
                return request
                    .post('/api/feg_list/4')
                    .send({
                        "feggie_id": "4",
                        "feg_name": "carrot",
                        "img_src": "https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d"
                    })
                    .expect(201)
                    .then(({ body: { feggie } }) => {
                        return request
                            .put(`/api/feg_list/${feggie.feg_list_id}?amount=down`)
                            .expect(201)
                            .then(({ body: { feg_list } }) => {
                                expect(feg_list).to.be.an('object')
                                expect(feg_list.feggie_id).to.equal(4)
                                expect(feg_list.amount).to.equal(0)
                            })
                    })
            })
            it('DELETE remove item/feg in list', () => {
                // let list_id;
                return request
                    .post('/api/feg_list/3')
                    .send({
                        "feggie_id": "3",
                        "feg_name": "brussels sprouts",
                        "img_src": "https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d"
                    })
                    .expect(201)
                    .then(({ body: { feggie } }) => {
                        // return list_id = feggie.feg_list_id
                        return request
                            .delete(`/api/feg_list/${feggie.feg_list_id}`)
                            .expect(202)
                            .then(({ body: { feg_list } }) => {
                                expect(feg_list).to.be.an('object')
                                expect(feg_list.feg_name).to.equal('brussels sprouts')
                            })
                    })

            })
        })
    })
    describe('error handeling', () => {
        describe('feg types', () => {
            it('returns 404 for non-existing feg_type id', () => {
                return request
                    .get(`/api/feg_types/${4}`)
                    .expect(404)
                    .then(({ body }) => {
                        expect(body.message).to.equal('Not Found')
                    })
            })
            it('returns 400 for bad request non-id structure', () => {
                return request
                    .get('/api/feg_types/cow')
                    .expect(400)
                    .then(({ body }) => {
                        expect(body.message).to.equal('Bad Request')
                    })
            })
        })
        describe('months', () => {
            it('returns 404 for non-existing month id', () => {
                return request
                    .get(`/api/months/${40}/at_best`)
                    .expect(404)
                    .then(({ body }) => {
                        expect(body.message).to.equal('Not Found')
                    })
            })
            it('returns 400 for bad request non-id structure', () => {
                return request
                    .get('/api/months/cow/coming_in')
                    .expect(400)
                    .then(({ body }) => {
                        expect(body.message).to.equal('Bad Request')
                    })
            })
        })
        describe('feggies', () => {
            it('returns 404 for non-existing feggie id', () => {
                return request
                    .get(`/api/feggies/${400}`)
                    .expect(404)
                    .then(({ body }) => {
                        expect(body.message).to.equal('Not Found')
                    })
            })
            it('returns 400 for bad request non-id structure', () => {
                return request
                    .get('/api/feggies/cow')
                    .expect(400)
                    .then(({ body }) => {
                        expect(body.message).to.equal('Bad Request')
                    })
            })
            it('returns 404 for non-existing feggie id (seasonsal)', () => {
                return request
                    .get(`/api/feggies/${4400}/coming_in`)
                    .expect(404)
                    .then(({ body }) => {
                        expect(body.message).to.equal('Not Found')
                    })
            })
            it('returns 400 for bad request non-id structure (seasonsal)', () => {
                return request
                    .get('/api/feggies/foo/at_best')
                    .expect(400)
                    .then(({ body }) => {
                        expect(body.message).to.equal('Bad Request')
                    })
            })

        })
        describe('feg_list', () => {
            it('POST returns 404 for non-existing feg_id', () => {
                return request
                    .post('/api/feg_list/1000')
                    .send({
                        "feggie_id": "1000",
                        "feg_name": "foobar",
                        "img_src": "barfoo",
                        "amount": "0"
                    })
                    .expect(404)
                    .then((res) => {
                        expect(res.body.message).to.equal('Not Found')
                        expect(res.error.status).to.equal(404)
                        expect(res.error.text).to.equal('{"message":"Not Found"}');
                    })

            })
            it('POST returns 400 if url feg_id does not match send feggie_id', () => {
                return request
                    .post('/api/feg_list/100')
                    .send({
                        "feggie_id": "1",
                        "feg_name": "aubergine",
                        "img_src": "https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d",
                        "amount": "0"
                    })
                    .expect(400)
                    .then(res => {
                        expect(res.body.message).to.equal('Bad Request')
                        expect(res.error.status).to.equal(400)
                        expect(res.error.text).to.equal('{"message":"Bad Request"}');
                    })
            })
            it('POST returns 400 for bad request non-id structure', () => {
                return request
                    .post('/api/feg_list/foo')
                    .send({
                        "feggie_id": "1",
                        "feg_name": "aubergine",
                        "img_src": "https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d",
                        "amount": "0"
                    })
                    .expect(400)
                    .then(res => {
                        expect(res.body.message).to.equal('Bad Request')
                        expect(res.error.status).to.equal(400)
                        expect(res.error.text).to.equal('{"message":"Bad Request"}');
                    })
            })
            it('POST returns 400 for bad post request w/out all required inputs', () => {
                return request
                    .post('/api/feg_list/1')
                    .send({
                        "feggie_id": "1",
                        "amount": "0"
                    })
                    .expect(400)
                    .then(res => {
                        expect(res.body.message).to.equal('Bad Request')
                        expect(res.error.status).to.equal(400)
                        expect(res.error.text).to.equal('{"message":"Bad Request"}');
                    })
            })
            it('PUT returns 400 incorrect query', () => {
                return request
                    .put('/api/feg_list/1?amount=bananas')
                    .expect(400)
                    .then(res => {
                        expect(res.body.message).to.equal('Bad Request')
                        expect(res.error.status).to.equal(400)
                        expect(res.error.text).to.equal('{"message":"Bad Request"}');
                    })

            })
            it('PUT ignores  404 for non-existing feg_list_id', () => {
                return request
                    .put('/api/feg_list/6?amount=up')
                    .expect(404)
                    .then((res) => {
                        expect(res.body.message).to.equal('Not Found')
                        expect(res.error.status).to.equal(404)
                        expect(res.error.text).to.equal('{"message":"Not Found"}');
                    })
            })
            it('PUT ignores  400 for bad request non-id structure', () => {
                return request
                    .put('/api/feg_list/vegtable?amount=up')
                    .expect(400)
                    .then(res => {
                        expect(res.body.message).to.equal('Bad Request')
                        expect(res.error.status).to.equal(400)
                        expect(res.error.text).to.equal('{"message":"Bad Request"}');
                    })
            })
            it('DELETE 404 when id not in list', () => {
                return request
                    .delete(`/api/feg_list/32`)
                    .expect(404)
                    .then(res => {
                        expect(res.body.message).to.equal('Not Found')
                        expect(res.error.status).to.equal(404)
                        expect(res.error.text).to.equal('{"message":"Not Found"}');
                    })
            })
            it('DELETE 400 for bad request non-id structure', () => {
                return request
                    .delete(`/api/feg_list/bananas`)
                    .expect(400)
                    .then(res => {
                        expect(res.body.message).to.equal('Bad Request')
                        expect(res.error.status).to.equal(400)
                        expect(res.error.text).to.equal('{"message":"Bad Request"}');
                    })
            })


        })
    })
})
process.env.NODE_ENV = 'test';

const { expect } = require('chai');
const request = require('supertest');
const app = require('../app');

describe('API', () => {
    describe('/api', () => {
        describe('/feg_types', () => {
            it('GET all feg_types', () => {
                request(app)
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
                request(app)
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
                request(app)
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
                request(app)
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
                request(app)
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
                request(app)
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
                request(app)
                    .get('/api/feggies/1')
                    .expect(200)
                    .then(({ body: { feggie } }) => {
                        expect(feggie).to.be.an('object')
                        expect(feggie.feggies_id).to.equal(1)
                        expect(feggie.name).to.equal('aubergine')
                    })
            })
            it('GET feggie season by id (coming_in)', () => {
                request(app)
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
                request(app)
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
                request(app)
                .get('/api/feg_list')
                .expect(200)
                .then(({ body: { feg_list } }) => {
                    expect(feg_list).to.be.an('array')
                    expect(feg_list.length).to.equal(0)
                })
            })
            it('POST a feg in list', () => {
                request(app)
                .post('/api/feg_list/1')
                .send({
                    "feggie_id": "1",
                    "feg_name":"aubergine",
                    "img_src":"https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d",
                    "amount": "0"
                })
                .expect(201)
                .then(({ body: {feggie} }) => {
                    expect(feggie).to.be.an('object')
                    expect(feggie).to.eql({
                        'feg_list_id': 1,
                        'feggie_id': 1,
                        'feg_name': 'aubergine',
                        'img_src': 'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d',
                        'amount': 0 
                    })
                })
            })
            it('PUT the amount of feg in list', () => {
                request(app)
                .put('/api/feg_list/1?amount=up')
                .expect(201)
                .then(({body: {feg_list}}) => {
                    expect(feg_list).to.be.an('object')
                    expect(feg_list.feg_list_id).to.equal(1)
                    expect(feg_list.feggie_id).to.equal(1)
                    expect(feg_list.amount).to.equal(1)
                })
            })
        })
    })
    describe('error handeling', () => {
        describe('feg types', () => {
            it('returns 404 for non-existing feg_type id', () => {
                request(app)
                    .get(`/api/feg_types/${4}`)
                    .expect(404)
                    .then(({ body }) => {
                        expect(body.message).to.equal('Not Found')
                    })
            })
            it('returns 400 for bad request non-id structure', () => {
                request(app)
                    .get('/api/feg_types/cow')
                    .expect(400)
                    .then(({ body }) => {
                        expect(body.message).to.equal('Bad Request')
                    })
            })
        })
        describe('months', () => {
            it('returns 404 for non-existing month id', () => {
                request(app)
                    .get(`/api/months/${40}/at_best`)
                    .expect(404)
                    .then(({ body }) => {
                        expect(body.message).to.equal('Not Found')
                    })
            })
            it('returns 400 for bad request non-id structure', () => {
                request(app)
                    .get('/api/months/cow/coming_in')
                    .expect(400)
                    .then(({ body }) => {
                        expect(body.message).to.equal('Bad Request')
                    })
            })
        })
        describe('feggies', () => {
                it('returns 404 for non-existing feggie id', () => {
                    request(app)
                        .get(`/api/feggies/${400}`)
                        .expect(404)
                        .then(({ body }) => {
                            expect(body.message).to.equal('Not Found')
                        })
                })
                it('returns 400 for bad request non-id structure', () => {
                    request(app)
                        .get('/api/feggies/cow')
                        .expect(400)
                        .then(({ body }) => {
                            expect(body.message).to.equal('Bad Request')
                        })
                })
                it('returns 404 for non-existing feggie id (seasonsal)', () => {
                    request(app)
                        .get(`/api/feggies/${4400}/coming_in`)
                        .expect(404)
                        .then(({ body }) => {
                            expect(body.message).to.equal('Not Found')
                        })
                })
                it('returns 400 for bad request non-id structure (seasonsal)', () => {
                    request(app)
                        .get('/api/feggies/foo/at_best')
                        .expect(400)
                        .then(({ body }) => {
                            expect(body.message).to.equal('Bad Request')
                        })
                })

        })
        describe('feg_list', () => {
            it('POST returns 404 for non-existing feg_id', () => {
                request(app)
                .post('/api/feg_list/1000')
                .send({
                    "feggie_id": "1000",
                    "feg_name":"foobar",
                    "img_src":"barfoo",
                    "amount": "0"
                })
                .expect(404)
                .then(({body}) => console.log(body))
            })
            it('POST returns 400 if url feg_id does not match send feggie_id', () => {
                request(app)
                .post('/api/feg_list/100')
                .send({
                    "feggie_id": "1",
                    "feg_name":"aubergine",
                    "img_src":"https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d",
                    "amount": "0"
                })
                .expect(400)
                .then(console.log)
            })
            it('POST returns 400 for bad request non-id structure', () => {
                request(app)
            })
            it('POST returns 400 for bad post request w/out all required inputs', () => {
                request(app)
            })
            it('PUT returns 400 incorrect query', () => {
                request(app)

            })
            it('PUT ignores  404 for non-existing feg_list_id', () => {
                request(app)
                
            })
            it('PUT ignores  404 for bad request non-id structure', () => {
                request(app)
                
            })
        })
    })
})
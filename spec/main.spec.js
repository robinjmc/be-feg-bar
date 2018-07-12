process.env.NODE_ENV='test';

const {expect} = require('chai');
const request = require('supertest');
const app = require('../app');

describe('API', () => {
    describe('/api', () => {
        describe('/feg_types', () => {
            it('GET all feg_types', () => {
                request(app)
                .get('/api/feg_types')
                .expect(200)
                .then(({body: {feg_types}}) => {
                    expect(feg_types).to.be.an('array')
                    expect(feg_types[0]).to.be.an('object')
                    expect(feg_types[0].name).to.equal('Vegetable')
                    expect(feg_types[1].slug).to.equal('fruit')
                })
            })
            it('GET all feggies by type', () => {
                request(app)
                .get('/api/feg_types/2')
                .expect(200)
                .then(({body: {feg_types}}) => {
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
                .then(({body: {months}}) => {
                    expect(months).to.be.an('array')
                    expect(months[0]).to.be.an('object')
                    expect(months[0].name).to.equal('January')
                    expect(months[10].slug).to.equal('nov')
                })
            })
        })
        describe('/feggies', () => {
            it('GET all feggies', () => {
                request(app)
                .get('/api/feggies')
                .expect(200)
                .then(({body: {feggies}}) => {
                    expect(feggies).to.be.an('array')
                    expect(feggies[0]).to.be.an('object')
                    expect(feggies[5].name).to.equal('celery')
                    expect(feggies[32].feg_type_id).to.equal(2)
                })
            })
            it('GET all feggies by month (coming_in)', () => {
                request(app)
                .get(`/api/feggies/coming_in/${1}`)
                .expect(200)
                .then(({body: {feggies}}) => {
                    console.log(feggies)  
                })
            })
            it('GET all feggies by month (at_best)', () => {
                request(app)
                .get(`/api/feggies/at_best/${7}`)
                .expect(200)
                .then(({body: {feggies}}) => {
                    console.log(feggies)  
                })
            })
            it('GET feggie by id', () => {
                request(app)
                .get('/api/feggies/1')
                .expect(200)
                .then(({body: {feggie}}) => {
                    console.log(feggie)  
                })
            })
        })
    })
    describe('error handeling', () => {
        
    })
})
# Fegbar Back End

be-feg-bar deployed: http://feg-bar.herokuapp.com

A REST-ful API serving data. Feg Types, Months, Feggies & Feg List.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Node.js
download Node by following the installtion steps on their website (https://nodejs.org/en/)

Postgres.app
download the Postgres.app (or equivalent full-featured PostgreSQL) by following the installtion steps on their website (https://postgresapp.com)

### Installing

# Npm install
CD into the project folder and in the command line run $npm install or $npm i

# Config
Create a SQL database in Postgres for use in development named fegtable

Inside the project folder create a database folder called 'db' that includes the file index.js and a congif folder called 'config'

The index.js file should include the following:

```
const pgp = require('pg-promise')({promiseLib: Promise});
const config = process.env.DATABASE_URL ? process.env.DATABASE_URL : require(`./config/${process.env.NODE_ENV}.js`);

module.exports = pgp(config);
```

Inside the config folder create a file called dev.js

dev.js should include a link to the database: module.exports = "postgres://localhost:PORT_NUMBER/fegtable"

'PORT_NUMBER' Is the number your SQL database is running on locally (the default for Postgres is 5432)

# Seed Development Database
In the command line run: $npm run seed

# Run Locally
To run locally with nodemon in the browser run in the command line: $npm run dev

To run locally without nodemon: $npm run start

# Config
Create a SQL database in Postgres for use in testing named fegtable_test

In the config folder create a file called test.js

dev.js should include a link to the database: module.exports = "postgres://localhost:PORT_NUMBER/fegtable_test"

'PORT_NUMBER' Is the number your  SQL database is running on locally (the default for Postgres is 5432)

# Running the tests
In the command line run: $npm run test

### Endpoints

``` http
GET /
```

Serves an HTML page with documentation for all the available endpoints

``` http
GET /api/feg_types/
```

Get all the types feg (fruit, vegetable, etc.)

``` http
GET /api/feg_types/:feg_type_id
```

Return all the feggies by type

``` http
GET /api/months
```

Returns all the months

``` http
GET /api/months/:whats_in
```

Get all feggies by month and whether they are in season (at_best) or coming in to season soon (coming_in)

``` http
GET /api/feggies
```

Returns a JSON object with the data of every individual feg.

``` http
GET /api/feggies/:feg_id
```

Returns the data of a individual feg.

``` http
GET /api/feggies/:feg_id/:whats_in
```

Get all the months that a individual feg is either at_best or coming_in


``` http
GET /api/feg_list
```

Returns a JSON object with the data of each feg in the feg_list and amount.

``` http
POST /api/feg_list/:feg_id
```

Add a new feg to the feg list. This route requires a JSON body with feggie_id, feg_name and img_src key and their value pair
e.g:
    ```
    {
        "feggie_id": "1",
        "feg_name": "aubergine",
        "img_src": "https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d"
    }
    ```

``` http
PUT /api/feg_list/:feg_id
```

Increment or Decrement the amount of an feg by one. This route requires a amount query of 'up' or 'down'
e.g: `/api/feg_list/:feg_id?amount=up`


``` http
DELETE /api/feg_list/:feg_id
```

Deletes a feg from the feg_list

import pool from 'pg';

const config = require('./config');

const pool = new Pool({
  user: config.username,
  host: config.host,
  database: config.database,
  password: config.password,
  port: config.port,
});

module.exports = pool;

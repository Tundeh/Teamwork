const dotenv = require("dotenv");
dotenv.config();

module.exports = {
  host: process.env.HOST,
  port: process.env.DB_PORT,
  database: process.env.DATABASE,
  username: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD
};

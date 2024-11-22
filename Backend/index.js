const express = require("express");

const connectDB = require("./config/database");

const app = express();
const PORT = 8000;

//Connect to Database
connectDB();

app.listen(PORT, () => console.log(`Server running at port : ${PORT}`));

module.exports = app;

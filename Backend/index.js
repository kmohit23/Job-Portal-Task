const express = require("express");

const connectDB = require("./config/database");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT || 8000;

//Connect to Database
connectDB();

//Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//Routes
app.use("/api/auth", require("./routes/authRoutes"));
app.use("/api/user", require("./routes/userRoutes"));
app.use("/api/candidates", require("./routes/candidateRoutes"));
app.use("/api/upload", require("./routes/uploadRoutes"));

//Start Server
app.listen(PORT, () => console.log(`Server running at port : ${PORT}`));

module.exports = app;

const express = require("express");

const app = express();
const PORT = 8000;

app.listen(PORT, () => console.log(`Serveer runing at port : ${PORT}`));

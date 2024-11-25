const express = require("express");
const { get } = require("../controllers/userController");
const { authMiddleware } = require("../middlewares/authenticationMiddleware");

const router = express.Router();

router.get("/", authMiddleware, get);

module.exports = router;

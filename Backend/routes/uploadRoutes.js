const express = require("express");
const router = express.Router();
const { uploadFile } = require("../controllers/uploadController");
const { authMiddleware } = require("../middlewares/authenticationMiddleware");

router.post("/", authMiddleware, uploadFile);

module.exports = router;

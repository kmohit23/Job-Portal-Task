const express = require("express");
const router = express.Router();
const {
  createCandidate,
  getAllCandidates,
  getCandidateById,
} = require("../controllers/candidateController");
const { authMiddleware } = require("../middlewares/authenticationMiddleware");

//Routes

router.post("/", authMiddleware, createCandidate);

router.get("/", authMiddleware, getAllCandidates);

router.get("/:id", authMiddleware, getCandidateById);

module.exports = router;

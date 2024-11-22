const Candidate = require("../models/candidate");

const createCandidate = async (req, res) => {
  try {
    const { name, email, contact, education, job_role } = req.body;
    //Check if candidate already exists
    let candidate = await Candidate.findOne({ email });
    if (candidate) {
      return res.status(400).json({ message: "Candidate already exists" });
    }

    //Upload resume if exists
    let profile_image_url = "";
    //todo

    //Upload if resume exits
    let resume_url = "";
    //todo

    //Create new Candidate
    candidate = new Candidate({
      name,
      email,
      contact,
      education,
      job_role,
      profile_image_url,
      resume_url,
    });

    await candidate.save();

    res.status(201).json({
      message: "Candidate created successfully ",
      candidate,
    });
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

const getAllCandidates = async (req, res) => {
  try {
    const candidates = await Candidate.find().select("-__v");
    res.json(candidates);
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

const getCandidateById = async (req, res) => {
  try {
    const candidate = await Candidate.findById(req.params.id).select("-__v");
    if (!candidate) {
      return res.status(404).json({ message: "Candidate not found" });
    }
    res.json(candidate);
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

module.exports = { createCandidate, getAllCandidates, getCandidateById };

const Candidate = require("../models/candidate");

const upload = require("../middlewares/multerS3Middleware");

const createCandidate = async (req, res) => {
  try {
    const { name, email, contact, education, job_role } = req.body;
    //Check if candidate already exists
    let candidate = await Candidate.findOne({ email });
    if (candidate) {
      return res.status(400).json({ message: "Candidate already exists" });
    }

    let profile_image_url = "";

    let resume_url = "";

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
      data: candidate,
    });
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

const getAllCandidates = async (req, res) => {
  try {
    const candidates = await Candidate.find().select("-__v");
    res.status(200).json({
      message: "Fetched Succesfully",
      data: candidates,
    });
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
    res.status(200).json({
      message: "Fetched Successfully",
      data: candidate,
    });
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

module.exports = { createCandidate, getAllCandidates, getCandidateById };

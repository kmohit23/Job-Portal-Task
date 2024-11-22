const { Schema, model } = require("mongoose");

const candidateSchema = new Schema(
  {
    name: {
      type: String,
      required: true,
      trim: true,
    },
    email: {
      type: String,
      required: true,
      unique: true,
      lowercase: true,
    },
    contact: {
      type: String,
      required: true,
    },
    education: {
      type: String,
      required: true,
    },
    job_role: {
      type: String,
      required: true,
    },
    profile_image_url: {
      type: String,
    },
    resume_url: {
      type: String,
    },
  },
  { timestamps: true }
);

const Candidate = model("candidate", candidateSchema);

module.exports = Candidate;

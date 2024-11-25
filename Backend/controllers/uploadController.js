const upload = require("../middlewares/multerS3Middleware");

const Candidate = require("../models/candidate");

const uploadFile = async (req, res) => {
  await upload(req, res, async function (err) {
    if (err) {
      return res.status(400).send({
        result: 0,
        message: err,
      });
    }
    const email = req.user.email;
    if (req.files["profileImage"]) {
      await Candidate.findOneAndUpdate(
        { email },
        { $set: { profile_image_url: req.files.profileImage[0].location } }
      );
      let candidate = await Candidate.findOne({ email });
      return res.status(200).send({
        result: candidate,
        message: "uploaded successfully",
      });
    } else if (req.files["resume"]) {
      await Candidate.findOneAndUpdate(
        { email },
        { $set: { resume_url: req.files.resume[0].location } }
      );
      let candidate = await Candidate.findOne({ email });

      return res.status(200).send({
        result: candidate,
        message: "uploaded successfully",
      });
    }
  });
};

module.exports = { uploadFile };

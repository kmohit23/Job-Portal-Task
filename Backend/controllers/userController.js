const { User } = require("../models/user");

const get = (req, res) => {
  try {
    res
      .status(200)
      .json({ message: "User Data Fetched Successfully", data: req.user });
  } catch (error) {
    res.status(500).json({ message: "Internal Server Error" });
  }
};

module.exports = { get };

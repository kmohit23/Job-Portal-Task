const multer = require("multer");
const multerS3 = require("multer-s3-transform");
const { S3 } = require("../config/aws");

const upload = multer({
  storage: multerS3({
    s3: S3,
    bucket: process.env.AWS_S3_BUCKET_NAME,
    acl: "public-read",
    key: function (req, file, cb) {
      if (file.fieldname == "profileImage") {
        cb(null, "profileImage/" + file.originalname);
      } else if (file.fieldname == "resume") {
        cb(null, "resume/" + file.originalname);
      }
    },
  }),
});

module.exports = upload.fields([
  { name: "profileImage", maxCount: 1 },
  { name: "resume", maxCount: 1 },
]);

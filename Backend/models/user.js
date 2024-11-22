const { Schema, model } = require("mongoose");
const bcrypt = require("bcrypt");

const userSchema = new Schema(
  {
    name: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
      unique: true,
    },
    password: {
      type: String,
      required: true,
    },
    role: {
      type: String,
      enum: ["user", "admin"],
      default: "user",
    },
  },
  { timestamps: true }
);

//Hash the password before saving in db
userSchema.pre("save", function (next) {
  const user = this;
  if (!user.isModified("password")) return;
  const saltRounds = 10;
  bcrypt.hash(user.password, saltRounds, (err, hashedPassword) => {
    if (err) {
      console.error("Error hashing the password", err);
    } else {
      user.password = hashedPassword;
    }
    next();
  });
});

//Method to comparePassword

userSchema.methods.comparePassword = async function (userPassword) {
  return bcrypt.compare(userPassword, this.password);
};

const User = model("user", userSchema);

module.exports = User;

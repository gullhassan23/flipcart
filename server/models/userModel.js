const mongoose = require("mongoose");
const validator = require("validator");
const bcryptjs = require("bcryptjs");
// const jwt = require("jsonwebtoken");
// const crypto = require("crypto");

const userSchema = mongoose.Schema({
  name: {
    type: String,
    required: [true, "Please Enter Your Name"],
    maxLength: [20, "Name cannot be exceed 20 characters"],
    minLength: [3, "Name should have more than 4 characters "],
  },
  email: {
    type: String,
    required: [true, "Please Enter Your Email"],
    unique: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
  password: {
    type: String,
    required: [true, "Please Enter Your Password"],
    minLength: [8, "Password should be greater than 8 character"],
  },
  address: {
    type: String,

    default: "",
  },

  role: {
    type: String,
    default: "user",
  },

  // resetPasswordToken: String,
  // resetPasswordExpire: Date,
});

// userSchema.pre("save", async function (next) {
//   if (!this.isModified("password")) {
//     next();
//   }
//   this.password = await bcrypt.hash(this.password, 10);
// });

// JWT Token
// userSchema.methods.getJWTToken = function () {
//   return jwt.sign({ id: this._id }, process.env.JWT_SECRET, {
//     expiresIn: process.env.JWT_EXPIRE,
//   });
// };

// Compare Password
// userSchema.methods.comparePassword = async function (enteredPassword) {
//   return await bcrypt.compare(enteredPassword, this.password);
// };

// Generating Password reset Token
// userSchema.methods.getResetPasswordToken = function () {
//   // Generating Token
//   const resetToken = crypto.randomBytes(20).toString("hex");

//   // Hashing and adding resetPasswordToken to userSchema
//   this.resetPasswordToken = crypto
//     .createHash("sha256")
//     .update(resetToken)
//     .digest("hex");

//   this.resetPasswordExpire = Date.now() + 15 * 60 * 1000;

//   return resetToken;
// };

module.exports = mongoose.model("User", userSchema);

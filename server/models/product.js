const mongoose = require("mongoose");
const validator = require("validator");
const bcryptjs = require("bcryptjs");
// const jwt = require("jsonwebtoken");
// const crypto = require("crypto");

const productSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],

  quantity: {
    type: Number,

    required: true,
  },

  category: {
    type: String,
    required: true,
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

module.exports = mongoose.model("Product", productSchema);

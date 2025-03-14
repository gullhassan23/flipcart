const catchAsyncErrors = require("../middleware/catchAsyncError");
const bcryptjs = require("bcryptjs");
const User = require("../models/userModel");

const jwt = require("jsonwebtoken");

exports.registerUser = catchAsyncErrors(async (req, res, next) => {
  try {
    const { name, email, password } = req.body;
    const ExistingUser = await User.findOne({ email });
    if (ExistingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exist!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);
    let user = new User({
      email,
      password: hashedPassword,
      name,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
  // post that data in database
});

exports.SignIn = catchAsyncErrors(async (req, res, next) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this email does not exist!" });
    }

    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect password." });
    }

    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

exports.GetUserData = catchAsyncErrors(async (req, res, next) => {
  try {
    const token = req.header("x-header-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);
    const user = await User.findById(verified.id);
    if (!user) {
      return res.json(false);
    }
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

exports.getfile = catchAsyncErrors(async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});

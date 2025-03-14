const Product = require("../models/product");
const ErrorHander = require("../utils/error");
const catchAsyncError = require("./catchAsyncError");

const Jwt = require("jsonwebtoken");

exports.isAuthenticatedUser = catchAsyncError(async (req, next) => {
  // We do this because our token is stored in cookie
  const { token } = req.cookies;

  //   console.log(token);
  if (!token) {
    return next(new ErrorHander("PLEASE LOGIN TO ACCESS THIS RESOURCES", 401));
  }

  const decodeData = Jwt.verify(token, process.env.JWT_SECRET);
  req.user = await User.findById(decodeData.id);
  next();
});

// Creating roles
exports.authorizeRoles = (...roles) => {
  return (req, res, next) => {
    if (!roles.includes(req.user.role)) {
      return next(
        new ErrorHander(
          `Role:${req.user.role} is not allowed to access this resource`,
          403
        )
      );
    }

    next();
  };
};

exports.auth2 = catchAsyncError(async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token)
      return res.status(401).json({ msg: "No auth token, access denied" });

    const verified = Jwt.verify(token, "passwordKey");
    if (!verified)
      return res
        .status(401)
        .json({ msg: "Token verification failed, authorization denied" });

    req.user = verified.id;
    req.token = token;
    next();
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

exports.adminn = catchAsyncError(async (req, res, next) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;

    let product = new Product({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

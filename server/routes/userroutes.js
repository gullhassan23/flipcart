const express = require("express");
const {
  registerUser,
  SignIn,
  GetUserData,

  getfile,
} = require("../controller/usercontroller");
const auth2 = require("../middleware/auth");

const authRouter = express.Router();

// Api signup
authRouter.route("/Register").post(registerUser);
authRouter.route("/Login").post(SignIn);
authRouter.route("/tokenIsValid").post(GetUserData);
authRouter.route("/", auth2).get(getfile);
// Because this file is private that why we must be export it
module.exports = authRouter;

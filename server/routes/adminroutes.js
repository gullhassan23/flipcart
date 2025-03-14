const express = require("express");

const adminRoute = express.Router();
const admin = require("../middleware/admin");
const { adminn } = require("../middleware/auth");

// Add Product
adminRoute.route("/admin/add-product", adminn).post(admin);

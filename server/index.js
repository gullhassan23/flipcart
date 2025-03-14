const express = require("express");
// const dotenv = require("dotenv");
const authRouter = require("./routes/userroutes.js");

const connectDataBase = require("./config/database");

const PORT = 3000;
const app = express();

// //config
// dotenv.config({ path: "server/config/config.env" });

// connections
connectDataBase();

// middleWare
app.use(express.json());
app.use(authRouter);

// Connections

app.listen(PORT, "0.0.0.0", () => {
  console.log(`listening on ${PORT}`);
});

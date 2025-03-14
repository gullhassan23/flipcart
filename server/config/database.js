const mongoose = require("mongoose");
const DB_URI = "mongodb://127.0.0.1:27017/Amazona";
const connectDataBase = () => {
  mongoose.connect(DB_URI).then((data) => {
    console.log(`MonogDB connected with server :${data.connection.host}`);
  });
  // .catch((error) => {
  //   console.log(error);\
  // });
};

module.exports = connectDataBase;

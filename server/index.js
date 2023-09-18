//Imports from Packages
const express = require('express');
const mongoose = require('mongoose');

//Imports from moules(folders or files within our server)
const appRouter = require('./routes/auth.js');
const password = require("./secrets.js");

//Packages Initializations
const app = express()
const port = process.env.PORT || 3000;
const uri = `mongodb+srv://odetundeoreoluwadavid:${password}@alibabacloneappcluster.rg50mws.mongodb.net/?retryWrites=true&w=majority&appName=AtlasApp`;

//Middleware(for additional functionality)
app.use(express.json());
app.use(appRouter);

//Connect to Database(MongoDB) at default port 3000
mongoose.connect(uri)
  .then(() => {
    console.log('MongoDB Connection Succeeded.');
  })
  .catch((err) => {
    console.log('Error in DB connection: ' + err)
  });

//Listening on port 3000
app.listen(port, "0.0.0.0", () => {
    console.log(`Server is running on port ${port}`)
});
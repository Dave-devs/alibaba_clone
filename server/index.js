//Imports from Packages
const express = require('express');
const mongoose = require('mongoose');

//Imports from moules(folders or files within our server)
const appRouter = require('./routes/auth.js');
const adminRouter = require('./routes/admin.js');
const password = require("./secrets.js");

//Packages Initializations
const app = express()
const PORT = process.env.PORT || 3000;
const uri = `mongodb+srv://odetundeoreoluwadavid:${password}@alibabacloneappcluster.rg50mws.mongodb.net/?retryWrites=true&w=majority&appName=AtlasApp`;

//Middleware(for additional functionality)
app.use(express.json());
app.use(appRouter);
app.use(adminRouter);

//Connect to Database(MongoDB) at port 3000
mongoose.connect(uri)
  .then(() => {
    console.log('MongoDB Connection Succeeded.');
  })
  .catch((err) => {
    console.log('Error in DB connection: ' + err)
  });

//Listening on port 3000
app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server is running on port ${PORT}`)
});
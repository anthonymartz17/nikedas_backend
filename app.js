const express = require("express");
const app = express();

const cors = require("cors");
app.use(cors());
app.use(express.json());


const shoesController = require("./controller/shoes.controller");
app.use("/shoes", shoesController);



app.get("/", (req, res) => {
	res.send("Welcome to Nikedas");
});

app.get("*", (req, res) => {
	res.status(404).json({ error: "Page not found" });
});
module.exports = app;

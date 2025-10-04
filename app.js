// dependencies
const express = require("express");
const app = express();
const cors = require("cors");

// controllers
const shoesController = require("./controller/shoes.controller");
const usersController = require("./controller/users.controller");


// middleware
app.use(cors());
app.use(express.json());

// routes
app.use("/shoes", shoesController);
app.use("/users", usersController);


// healthcheck
app.get("/", (req, res) => {
	res.send("Welcome to Nikedas");
});

// 404
app.get("*", (req, res) => {
	res.status(404).json({ error: "Page not found" });
});

// export
module.exports = app;

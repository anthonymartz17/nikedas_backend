// dependencies
const express = require("express");
const app = express();
const cors = require("cors");

// controllers
const shoesController = require("./controller/shoes.controller");

// middleware
app.use(cors());
app.use(express.json());

app.use("/shoes", shoesController);

const usersController = require("./controller/users.controller");
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

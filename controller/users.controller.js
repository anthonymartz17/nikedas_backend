// dependencies
const express = require("express");
const users = express.Router();

// queries
const { getAllUsers, getUser } = require("../queries/users.queries.js");

// routes
users.get("/", async (req, res) => {
	try {
		const allUsers = await getAllUsers();
		res.status(200).json(allUsers);
	} catch (error) {
		res.status(404).json({ error: "Resource not found" });
	}
});

users.get("/:id", async (req, res) => {
	try {
		const { id } = req.params;
		const user = await getUser(id);
		res.status(200).json(user);
	} catch (error) {
		res.status(404).json({ error: "User not found" });
	}
});

module.exports = users;

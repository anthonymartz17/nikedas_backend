// dependencies
const express = require("express");
const users = express.Router();

// queries
const {
	getAllUsers,
	getUser,
	updateUser,
} = require("../queries/users.queries.js");

// routes
users.get("/", async (req, res) => {
	try {
		const allUsers = await getAllUsers();
		res.status(200).json(allUsers);
	} catch (error) {
		res.status(404).json({ error: "Resource not found" });
	}
});
//create

//show
users.get("/:id", async (req, res) => {
	try {
		const { id } = req.params;
		const user = await getUser(id);
		res.status(200).json(user);
	} catch (error) {
		res.status(404).json({ msg: "User not found", error });
	}
});

//update
users.put("/:id", async (req, res) => {
	try {
		const { id } = req.params;
		const updatedUser = await updateUser(id, req.body);
		res.status(200).json(updatedUser);
	} catch (error) {
		res.status(200).json({ msg: "User not found", error });
	}
});

//delete

module.exports = users;

// dependencies
const express = require("express");
const users = express.Router();

// queries
const {
	getAllUsers,
	createUser,
	getUser,
	updateUser,
	deactivateUser,
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
users.post("/", async (req, res) => {
	try {
		const user = await createUser(req.body);
		res.status(200).json(user);
	} catch (error) {
		res
			.status(400)
			.json({ error: "server error creating user", msg:error.message});
	}
});

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

//deactivate user "delete"
users.put("/:id", async (req, res) => {
	try {
		const { id } = req.params;
		const deactivatedUser = await deactivateUser(id);
		res.status(200).json(deactivatedUser);
	} catch (error) {
		res.status(404).json({ msg: "User not found", error });
	}
});
module.exports = users;

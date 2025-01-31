// dependencies
const db = require("../db/dbConfig");

async function getAllUsers() {
	try {
		const allUsers = await db.any("SELECT * FROM users");
		return allUsers;
	} catch (error) {
		throw error;
	}
}
async function createUser({ uid, first_name, last_name, email, phone_number }) {
	try {
		const newUser = await db.one(
			"INSERT INTO users (uid,first_name, last_name, email, phone_number) VALUES ($1,$2,$3,$4,$5) RETURNING *",
			[uid, first_name, last_name, email, phone_number]
		);
		return newUser;
	} catch (error) {
		throw error;
	}
}
async function getUser(id) {
	try {
		const user = await db.one("SELECT * FROM users WHERE uid = $1", id);
		return user;
	} catch (error) {
		throw error;
	}
}

async function updateUser(id, { first_name, last_name, email, phone_number }) {
	console.log(id, "queries");
	try {
		const updatedUser = await db.one(
			"UPDATE users SET first_name= $1,last_name= $2, email= $3, phone_number= $4 WHERE uid = $5 RETURNING *",
			[first_name, last_name, email, phone_number, id]
		);
		return updatedUser;
	} catch (error) {
		throw error;
	}
}
async function deactiveUser(id) {
	try {
		const deactivatedUser = await db.one(
			"UPDATE users SET isActive = false WHERE uid = $1 RETURNING *",
			id
		);
		return deactivatedUser;
	} catch (error) {
		throw error;
	}
}

module.exports = {
	getAllUsers,
	createUser,
	getUser,
	updateUser,
	deactiveUser,
};

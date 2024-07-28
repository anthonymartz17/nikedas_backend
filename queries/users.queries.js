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
<<<<<<< HEAD
			"INSERT INTO users (first_name, last_name, email, phone_number) VALUES ($1, $2, $3, $4) RETURNING *",
			[first_name, last_name, email, phone_number]
=======
			"INSERT INTO users (uid,first_name, last_name, email, phone_number) VALUES ($1,$2,$3,$4,$5) RETURNING *",
			[uid, first_name, last_name, email, phone_number]
>>>>>>> main
		);
		return newUser;
	} catch (error) {
		throw error;
	}
}
async function getUser(id) {
	try {
		const user = await db.one("SELECT * FROM users WHERE id = $1", id);
		return user;
	} catch (error) {
		throw error;
	}
}

async function updateUser(id, { first_name, last_name, email, phone_number, about_store, is_active }) {
	try {
		const updatedUser = await db.one(
			"UPDATE users SET first_name=$1,last_name=$2, email=$3, phone_number=$4, about_store=$5, is_active=$6 WHERE id = $7 RETURNING *",
			[first_name, last_name, email, phone_number, about_store, is_active, id]
		);
		return updatedUser;
	} catch (error) {
		throw error;
	}
}
async function deactivateUser(id) {
	try {
		const deactivatedUser = await db.one(
			"UPDATE users SET isActive = false WHERE id = $1 RETURNING *",
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
	deactivateUser,
};

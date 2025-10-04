// dependencies
const db = require("../db/dbConfig");

async function getAllUsers() {
	const allUsers = await db.any("SELECT * FROM users");
	return allUsers;
}
async function createUser({
	uid,
	first_name,
	last_name,
	email,
	phone_number,
	account_type,
}) {
	const newUser = await db.one(
		"INSERT INTO users (uid,first_name, last_name, email, phone_number,account_type) VALUES ($1,$2,$3,$4,$5,$6) RETURNING *",
		[uid, first_name, last_name, email, phone_number, account_type]
	);
	return newUser;
}
async function getUser(id) {
	const user = await db.one("SELECT * FROM users WHERE uid = $1", id);
	return user;
}

async function updateUser(id, { first_name, last_name, email, phone_number }) {
	const updatedUser = await db.one(
		"UPDATE users SET first_name= $1,last_name= $2, email= $3, phone_number= $4 WHERE uid = $5 RETURNING *",
		[first_name, last_name, email, phone_number, id]
	);
	return updatedUser;
}
async function deactiveUser(id) {
	const deactivatedUser = await db.one(
		"UPDATE users SET isActive = false WHERE uid = $1 RETURNING *",
		id
	);
	return deactivatedUser;
}

module.exports = {
	getAllUsers,
	createUser,
	getUser,
	updateUser,
	deactiveUser,
};

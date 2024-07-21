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
async function getUser(id) {
	try {
		const user = await db.one("SELECT * FROM users WHERE id = $1", id);
		return user;
	} catch (error) {
		throw error;
	}
}

module.exports = {
  getAllUsers,
  getUser,
};

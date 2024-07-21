// dependencies
const db = require("../db/dbConfig");

async function getAllUsers() {
  try {
    const allUsers = await db.any("SELECT * FROM users");
    return allUsers;
  } catch(error) {
      throw error;
  }
};

module.exports = {
  getAllUsers
}
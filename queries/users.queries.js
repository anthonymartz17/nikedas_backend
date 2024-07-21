const db = require("../db/dbConfig");

async function geAllUsers() {
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
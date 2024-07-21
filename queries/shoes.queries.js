// dependencies
const db = require("../db/dbConfig.js");

async function getAllShoes() {
	try {
		const allShoes = await db.any("SELECT * FROM shoes");
    return allShoes
	} catch (error) {
		  throw error;
	}
};

async function getShoe(id) {
  try {
    const oneShoe = await db.one("SELECT * FROM shoes WHERE id = $1", id);
    return oneShoe
  } catch(error) {
      throw error
  }
}

module.exports = {
  getAllShoes,
  getShoe
};

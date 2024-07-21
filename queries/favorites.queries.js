// dependencies
const db = require("../db/dbConfig.js");

const getAllFavorites = async () => {
	try {
		const allFavorites = await db.any("SELECT * FROM favorites");
    return allFavorites
	} catch (error) {
		  throw error;
	}
};

module.exports = {
  getAllFavorites
};

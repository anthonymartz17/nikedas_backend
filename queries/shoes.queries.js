// dependencies
const db = require("../db/dbConfig.js");

const getAllShoes = async () => {
	try {
		const allShoes = await db.any("SELECT * FROM shoes");
    return allShoes
	} catch (error) {
		  throw error;
	}
};

module.exports = { getAllShoes };

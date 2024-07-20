const db = require("../db/dbConfig");

const getShoes = async () => {
	try {
		const shoes = await db.any("SELECT * FROM shoes");
		return shoes;
	} catch (error) {
		throw error;
	}
};

module.exports = { getShoes };

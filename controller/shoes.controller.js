const express = require("express");
const shoes = express.Router();
const { getShoes } = require("../queries/shoes.queries");
shoes.get("/", async (req, res) => {
	try {
		const shoes = await getShoes();
		res.status(200).json(shoes);
	} catch (error) {
		res.status(404).json({error:"Resource not found"});
	}
});

module.exports = shoes;

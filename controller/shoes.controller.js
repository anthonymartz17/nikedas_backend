// dependencies
const express = require("express");
const shoes = express.Router();

// queries
const { getAllShoes } = require("../queries/shoes.queries.js");

// routes
shoes.get("/", async (req, res) => {
  try {
    const allShoes = await getAllShoes();
		res.status(200).json(allShoes);
	} catch(error) {
		  res.status(404).json({error:"Resource not found"});
	}
});




module.exports = shoes;

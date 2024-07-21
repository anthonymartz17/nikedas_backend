// dependencies
const express = require("express");
const favorites = express.Router();

// queries
const { getAllFavorites } = require("../queries/favorites.queries.js");

// routes
favorites.get("/", async (req, res) => {
  try {
    const allFavorites = await getAllFavorites();
		res.status(200).json(allFavorites);
	} catch(error) {
		  res.status(404).json({error:"Resource not found"});
	}
});

module.exports = favorites;

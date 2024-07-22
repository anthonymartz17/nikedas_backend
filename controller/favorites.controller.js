// dependencies
const express = require("express");
const favorites = express.Router();

// queries
const { getAllFavorites, createFavorite } = require("../queries/favorites.queries.js");

// routes
// index
favorites.get("/", async (req, res) => {
  try {
    const allFavorites = await getAllFavorites();
		res.status(200).json(allFavorites);
	} catch(error) {
		  res.status(404).json({error:"Resource not found"});
	}
});

// toggle favorite 
favorites.post("/", async (req, res) => {
  try {
    const favorite = await createFavorite(req.body);
    console.log('controller',favorite)
    res.status(200).json(`faved or un faved`)
  } catch(error) {
    console.log(error)
    res.status(400).json({ error: 'bad request'});
  }
})

module.exports = favorites;

// dependencies
const express = require("express");
const shoes = express.Router();

// queries
const { getAllShoes, getShoe, createShoe } = require("../queries/shoes.queries.js");

// middleware
// validation

// routes
// index
shoes.get("/", async (req, res) => {
  try {
    const allShoes = await getAllShoes();
		res.status(200).json(allShoes);
	} catch(error) {
		  res.status(404).json({error:"Resource not found"});
	}
});

// show
shoes.get('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const oneShoe = await getShoe(id);
    res.status(200).json(oneShoe);
  } catch(error) {
      console.log(error);
      res.status(404).json({ error: `Shoe with id ${id} not found.`});
  } 
})

// create
shoes.post('/', async (req, res) => {
    // res.status(200).json({message: "create route"});

  try {
    const newShoe = await createShoe(req.body);
    res.status(200).json(newShoe);
  } catch(error) {
      res.status(400).json({ error: 'bad request'});
  }
})

module.exports = shoes;

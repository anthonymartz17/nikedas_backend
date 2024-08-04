// dependencies
const express = require("express");
const shoes = express.Router();

// queries
const {
	getAllShoes,
	getShoe,
	createShoe,
	deleteShoe,
	updateShoe,
	getShoesBySellerId,
} = require("../queries/shoes.queries.js");

// middleware
// validation
const { verifyToken } = require("../validations/authMiddleware.js");

// routes
// index
shoes.get("/", async (req, res) => {
	try {
		const allShoes = await getAllShoes();
		res.status(200).json(allShoes);
	} catch (error) {
		res.status(404).json({ error: "Resource not found", msg: error });
	}
});

// show
shoes.get("/:id", async (req, res) => {
	const { id } = req.params;
	try {
		const oneShoe = await getShoe(id);
		res.status(200).json(oneShoe);
	} catch (error) {
		console.log(error);
		res.status(404).json({ error: `Shoe with id ${id} not found.` });
	}
});

// create
shoes.post("/", async (req, res) => {
	try {
		const newShoe = await createShoe(req.body);
		res.status(200).json(newShoe);
	} catch (error) {
		res.status(400).json({ error: "bad request" });
	}
});

// delete
shoes.delete("/:id", async (req, res) => {
	const { id } = req.params;
	try {
		const deletedShoe = await deleteShoe(id);
		res.status(200).json(deletedShoe);
	} catch (error) {
		res.status(404).json({ error: `Shoe with id ${id} not found.` });
	}
});

// update
shoes.put("/:id", async (req, res) => {
	const { id } = req.params;

	try {
		const updatedShoe = await updateShoe(id, req.body);

		res.status(200).json(updatedShoe);
	} catch (error) {
		console.log(error);
		res.status(404).json({ error: `Shoe with id ${id} not found.` });
	}
});

// seller index
shoes.get("/seller/listings", verifyToken, async (req, res) => {
	const { uid } = req.user;
	try {
		const sellerShoes = await getShoesBySellerId(uid);
		res.status(200).json(sellerShoes);
	} catch (error) {
		res.status(400).json({ error: "No Results" });
	}
});

module.exports = shoes;

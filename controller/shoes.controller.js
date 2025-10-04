// dependencies
const express = require("express");
const shoes = express.Router();

// queries
const {
	getAllShoes,
	getShoesBySeller,
	getShoeById,
	createShoe,
	deleteShoe,
	updateShoe,
} = require("../queries/shoes.queries.js");

// middleware
const { verifyToken } = require("../middleware/auth.middleware.js");

// routes
// index
shoes.get("/", async (req, res) => {
	try {
		const allShoes = await getAllShoes();

		if (!allShoes) {
			return res.status(404).json({ error: "Resource not found" });
		}

		res.status(200).json(allShoes);
	} catch (error) {
		res.status(500).json({ error: "Internal Server Error" });
	}
});

shoes.get("/seller-shoes", verifyToken, async (req, res) => {
	const { uid } = req.user;

	try {
		const sellerShoes = await getShoesBySeller(uid);
		if (!sellerShoes) {
			return res.status(404).json({ error: "Resource not found" });
		}
		res.status(200).json(sellerShoes);
	} catch (error) {
		res.status(500).json({ error: "Internal Server Error" });
	}
});

// show
shoes.get("/:id", async (req, res) => {
	const { id } = req.params;
	try {
		const shoe = await getShoeById(id);
		if (!shoe) {
			return res
				.status(404)
				.json({ error: `Shoe with id ${id} does not exist.` });
		}
		res.status(200).json(shoe);
	} catch (error) {
		res.status(500).json({ error: "Internal Server Error" });
	}
});

// create
shoes.post("/", verifyToken, async (req, res) => {
	const { uid } = req.user;
	try {
		const newShoe = await createShoe({ ...req.body, seller_id: uid });
		res.status(201).json(newShoe);
	} catch (error) {
		res.status(500).json({ error: "Internal Server Error" });
	}
});

// update
shoes.put("/:id", verifyToken, async (req, res) => {
	const { id } = req.params;
	const { user_id } = req.user;
	try {
		const shoe = await getShoeById(id);
		if (!shoe) {
			return res
				.status(404)
				.json({ error: `Shoe with id ${id} does not exist.` });
		}
		if (shoe.seller_id !== user_id) {
			return res.status(403).json({
				error: "Forbidden request. You are not the seller of this shoe",
			});
		}
		const updatedShoe = await updateShoe(id, req.body);

		res.status(200).json(updatedShoe);
	} catch (error) {
		console.log(error);
		res.status(404).json({ error: `Shoe with id ${id} not found.` });
	}
});

// delete
shoes.delete("/:id", verifyToken, async (req, res) => {
	const { id } = req.params;
	const { user_id } = req.user;

	try {
		const shoe = await getShoeById(id);

		if (!shoe) {
			res.status(404).json({ error: `Shoe with id ${id} does not exist.` });
		}
		if (shoe.seller_id !== user_id) {
			return res.status(403).json({
				error: "Forbidden request. You are not the seller of this shoe",
			});
		}
		const deletedShoe = await deleteShoe(id);

		res.status(200).json(deletedShoe);
	} catch (error) {
		res.status(500).json({ error: "Internal Server Error" });
	}
});


module.exports = shoes;

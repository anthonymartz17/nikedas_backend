// dependencies
const db = require("../db/dbConfig.js");

async function getAllShoes() {
	const allShoes = await db.any("SELECT * FROM shoes");
	return allShoes;
}
async function getShoesBySeller(seller_id) {
	const sellerShoes = await db.any(
		"SELECT * FROM shoes WHERE seller_id = $1",
		seller_id
	);

	return sellerShoes;
}

async function getShoeById(id) {
	const shoe = await db.oneOrNone("SELECT * FROM shoes WHERE id = $1", id);
	console.log(shoe)
	return shoe;
}

async function createShoe(shoe) {
	const newShoe = await db.one(
		"INSERT INTO shoes (brand, model, size, product_number, color, category, gender, price, description, created_at, updated_at, primary_img, secondary_img, seller_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14) RETURNING *",
		[
			shoe.brand,
			shoe.model,
			shoe.size,
			shoe.product_number,
			shoe.color,
			shoe.category,
			shoe.gender,
			shoe.price,
			shoe.description,
			shoe.created_at,
			shoe.updated_at,
			shoe.primary_img,
			shoe.secondary_img,
			shoe.seller_id,
		]
	);

	return newShoe;
}

async function deleteShoe(id) {
	const deletedShoe = await db.one(
		"DELETE FROM shoes WHERE id = $1 RETURNING *",
		id
	);
	return deletedShoe;
}

async function updateShoe(id, shoe) {
	const updatedShoe = await db.one(
		"UPDATE shoes SET brand = $1, model = $2, size = $3, product_number = $4, color = $5, category = $6, gender = $7, price = $8, description = $9, created_at = $10, updated_at = $11, primary_img = $12, secondary_img=$13 , seller_id = $14 WHERE id = $15 RETURNING *",
		[
			shoe.brand,
			shoe.model,
			shoe.size,
			shoe.product_number,
			shoe.color,
			shoe.category,
			shoe.gender,
			shoe.price,
			shoe.description,
			shoe.created_at,
			shoe.updated_at,
			shoe.primary_img,
			shoe.secondary_img,
			shoe.seller_id,
			id,
		]
	);
	return updatedShoe;
}

async function getShoesBySellerId(id) {
	const sellerShoes = await db.any(
		"SELECT * FROM shoes WHERE seller_id = $1",
		id
	);
	return sellerShoes;
}

module.exports = {
	getAllShoes,
	getShoesBySeller,
	getShoeById,
	createShoe,
	deleteShoe,
	updateShoe,
	getShoesBySellerId,
};

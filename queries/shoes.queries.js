// dependencies
const db = require("../db/dbConfig.js");

async function getAllShoes() {
	try {
		const allShoes = await db.any("SELECT * FROM shoes");
    return allShoes
	} catch (error) {
		  throw error;
	}
};

async function getShoe(id) {
  try {
    const oneShoe = await db.one("SELECT * FROM shoes WHERE id = $1", id);
    return oneShoe;
  } catch(error) {
      throw error
  }
}

async function createShoe(shoe) {
  try {
    const newShoe = await db.one('INSERT INTO shoes (brand, model, size, sku, colorway, category, gender, price, description, created_at, updated_at, img_url, seller_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) RETURNING *', [shoe.brand, shoe.model, shoe.size, shoe.sku, shoe.colorway, shoe.category, shoe.gender, shoe.price, shoe.description, shoe.created_at, shoe.updated_at, shoe.img_url, shoe.seller_id]);
    return newShoe;
  } catch(error) {
      throw error;
  }
}

async function deleteShoe(id) {
  try {
    // delete shoes from favorites
    await db.any('DELETE FROM favorites WHERE shoe_id = $1', id)

    // add deleted shoe to archive table

    // delete shoe
    const deletedShoe = await db.one('DELETE FROM shoes WHERE id = $1 RETURNING *', id);
    return deletedShoe;
  } catch(error) {
      throw error
  }
}

module.exports = {
  getAllShoes,
  getShoe,
  createShoe,
  deleteShoe
};

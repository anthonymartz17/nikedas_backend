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
    const newShoe = await db.one('INSERT INTO shoes (brand, model, size, sku, color, category, gender, price, description, created_at, updated_at, primary_img, secondary_img, seller_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14) RETURNING *', [shoe.brand, shoe.model, shoe.size, shoe.sku, shoe.color, shoe.category, shoe.gender, shoe.price, shoe.description, shoe.created_at, shoe.updated_at, shoe.primary_img, shoe.secondary_img, shoe.seller_id]);
    console.log(newShoe)
    return newShoe;
  } catch(error) {
      console.log(error)
      throw error;
  }
}

async function deleteShoe(id) {
 
  try {
    // delete shoes from favorites
    // await db.any('DELETE FROM favorites WHERE shoe_id = $1', id)

    // add deleted shoe to archive table

    // delete shoe
    const deletedShoe = await db.one('DELETE FROM shoes WHERE id = $1 RETURNING *', id);
    return deletedShoe;
  } catch(error) {
      throw error
  }
}

async function updateShoe(id, shoe) {
  try {
    const updatedShoe = await db.one('UPDATE shoes SET brand = $1, model = $2, size = $3, sku = $4, color = $5, category = $6, gender = $7, price = $8, description = $9, created_at = $10, updated_at = $11, primary_img = $12, secondary_img=$13 , seller_id = $14 WHERE id = $15 RETURNING *', [shoe.brand, shoe.model, shoe.size, shoe.sku, shoe.color, shoe.category, shoe.gender, shoe.price, shoe.description, shoe.created_at, shoe.updated_at, shoe.primary_img, shoe.secondary_img, shoe.seller_id, id])
    return updatedShoe
  } catch(error) {
      throw error
  }
}

async function getShoesBySellerId(id) {
  try {
    const sellerShoes = await db.any("SELECT * FROM shoes WHERE seller_id = $1", id)
    return sellerShoes;
  } catch(error) {
      throw error
  }
}

module.exports = {
  getAllShoes,
  getShoe,
  createShoe,
  deleteShoe,
  updateShoe,
  getShoesBySellerId
};

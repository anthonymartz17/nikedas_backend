// dependencies
const db = require("../db/dbConfig.js");

// middleware
// update to use middleware to route create favorite and delete favorite.


async function getAllFavorites() {
	try {
		const allFavorites = await db.any("SELECT * FROM favorites");
    return allFavorites
	} catch (error) {
		  throw error;
	}
};

async function createFavorite(favorite) {
  const user_shoe_favorite = `${favorite.user_id}-${favorite.shoe_id}`
  // check if user_shoe favorite exists
  const checkFavorite = await db.any("SELECT * FROM favorites WHERE user_shoe_favorite = $1", user_shoe_favorite)
  console.log('check', checkFavorite)

  if (checkFavorite[0]) {
    try {
      const deletedFavorite = await deleteFavorite(favorite);
      console.log('del', deletedFavorite[0])
      return deletedFavorite;
    } catch(error) {
        throw error;
    }

  } else {

    try {
      const newFavorite = await db.one("INSERT INTO favorites (user_shoe_favorite, user_id, shoe_id) VALUES ($1, $2, $3) RETURNING *", [user_shoe_favorite, favorite.user_id, favorite.shoe_id]);
      return newFavorite
    } catch(error) {
        throw error
    }
  }
}

async function deleteFavorite(favorite) {
  const user_shoe_favorite = `${favorite.user_id}-${favorite.shoe_id}`
  try { 
    const deletedFavorite = await db.any("DELETE FROM favorites WHERE user_shoe_favorite = $1 RETURNING *", user_shoe_favorite);
    console.log('deleted fav', deletedFavorite)
    return deletedFavorite
  } catch(error) {
      throw error
  }
}

module.exports = {
  getAllFavorites,
  createFavorite,
  deleteFavorite
};

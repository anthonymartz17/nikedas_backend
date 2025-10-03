// dependencies
const db = require("../db/dbConfig.js");

// get all shoes with nested variants, sizes, and images
async function getAllShoes() {
	const rows = await db.any(`
    SELECT
      p.id AS product_id,
      p.product_number,
      p.brand,
      p.name AS product_name,
      p.description,
      p.price,
      p.default_variant_id,
      p.category_id,
      c.name AS category,
      p.audience_id,
      a.name AS audience,
      p.created_at,
      p.updated_at,
      v.id AS variant_id,
      v.color AS variant_color,
      v.total_stock AS variant_stock,
      vs.id AS size_id,
      vs.size,
      vs.stock AS size_stock,
      vi.id AS image_id,
      vi.url AS image_url,
      vi.is_main
    FROM products p
    JOIN categories c ON p.category_id = c.id
    JOIN audiences a ON p.audience_id = a.id
    LEFT JOIN variants v ON v.product_id = p.id
    LEFT JOIN variant_sizes vs ON vs.variant_id = v.id
    LEFT JOIN variant_images vi ON vi.variant_id = v.id
    ORDER BY p.id, v.id, vs.size, vi.id
  `);

	// transform flat rows into nested JSON
	const productsMap = new Map();

	rows.forEach((row) => {
		if (!productsMap.has(row.product_id)) {
			productsMap.set(row.product_id, {
				id: row.product_id,
				product_number: row.product_number,
				brand: row.brand,
				name: row.product_name,
				description: row.description,
				price: parseFloat(row.price),
				default_variant_id: row.default_variant_id,
				category: row.category,
				category_id: row.category_id,
				audience: row.audience,
				audience_id: row.audience_id,
				created_at: row.created_at,
				updated_at: row.updated_at,
				variants: [],
			});
		}

		const product = productsMap.get(row.product_id);

		if (row.variant_id) {
			let variant = product.variants.find((v) => v.id === row.variant_id);
			if (!variant) {
				variant = {
					id: row.variant_id,
					color: row.variant_color,
					total_stock: row.variant_stock,
					sizes: [],
					images: [],
				};
				product.variants.push(variant);
			}

			if (row.size_id && !variant.sizes.find((s) => s.size === row.size)) {
				variant.sizes.push({
					size: parseFloat(row.size),
					stock: row.size_stock,
				});
			}

			if (
				row.image_id &&
				!variant.images.find((img) => img.url === row.image_url)
			) {
				variant.images.push({
					url: row.image_url,
					is_main: row.is_main,
				});
			}
		}
	});

	return Array.from(productsMap.values());
}

// retrieves single shoe entity by id
async function getShoeById(id) {
	const rows = await db.any(
		`
    SELECT
      p.id AS product_id,
      p.product_number,
      p.brand,
      p.name AS product_name,
      p.description,
      p.price,
      p.default_variant_id,
      p.category_id,
      c.name AS category,
      p.audience_id,
      a.name AS audience,
      p.created_at,
      p.updated_at,
      v.id AS variant_id,
      v.color AS variant_color,
      v.total_stock AS variant_stock,
      vs.id AS size_id,
      vs.size,
      vs.stock AS size_stock,
      vi.id AS image_id,
      vi.url AS image_url,
      vi.is_main
    FROM products p
    JOIN categories c ON p.category_id = c.id
    JOIN audiences a ON p.audience_id = a.id
    LEFT JOIN variants v ON v.product_id = p.id
    LEFT JOIN variant_sizes vs ON vs.variant_id = v.id
    LEFT JOIN variant_images vi ON vi.variant_id = v.id
    WHERE p.id = $1
    ORDER BY v.id, vs.size, vi.id
  `,
		[id]
	);

	if (!rows.length) return null;

	// transform flat rows into nested JSON
	const product = {
		id: rows[0].product_id,
		product_number: rows[0].product_number,
		brand: rows[0].brand,
		name: rows[0].product_name,
		description: rows[0].description,
		price: parseFloat(rows[0].price),
		default_variant_id: rows[0].default_variant_id,
		category: rows[0].category,
		category_id: rows[0].category_id,
		audience: rows[0].audience,
		audience_id: rows[0].audience_id,
		created_at: rows[0].created_at,
		updated_at: rows[0].updated_at,
		variants: [],
	};

	rows.forEach((row) => {
		if (!row.variant_id) return;

		let variant = product.variants.find((v) => v.id === row.variant_id);
		if (!variant) {
			variant = {
				id: row.variant_id,
				color: row.variant_color,
				total_stock: row.variant_stock,
				sizes: [],
				images: [],
			};
			product.variants.push(variant);
		}

		if (row.size_id && !variant.sizes.find((s) => s.size === row.size)) {
			variant.sizes.push({
				size: parseFloat(row.size),
				stock: row.size_stock,
			});
		}

		if (
			row.image_id &&
			!variant.images.find((img) => img.url === row.image_url)
		) {
			variant.images.push({
				url: row.image_url,
				is_main: row.is_main,
			});
		}
	});

	return product;
}

// get shoes by seller_id
async function getShoesBySeller(seller_id) {
	const rows = await db.any(
		`
    SELECT
      p.id AS product_id,
      p.product_number,
      p.brand,
      p.name AS product_name,
      p.description,
      p.price,
      p.default_variant_id,
      p.category_id,
      c.name AS category,
      p.audience_id,
      a.name AS audience,
      p.created_at,
      p.updated_at,
      v.id AS variant_id,
      v.color AS variant_color,
      v.total_stock AS variant_stock,
      vs.id AS size_id,
      vs.size,
      vs.stock AS size_stock,
      vi.id AS image_id,
      vi.url AS image_url,
      vi.is_main
    FROM products p
    JOIN categories c ON p.category_id = c.id
    JOIN audiences a ON p.audience_id = a.id
    LEFT JOIN variants v ON v.product_id = p.id
    LEFT JOIN variant_sizes vs ON vs.variant_id = v.id
    LEFT JOIN variant_images vi ON vi.variant_id = v.id
    WHERE p.seller_id = $1
    ORDER BY p.id, v.id, vs.size, vi.id
  `,
		[seller_id]
	);

	// same nested processing as above
	const productsMap = new Map();

	rows.forEach((row) => {
		if (!productsMap.has(row.product_id)) {
			productsMap.set(row.product_id, {
				id: row.product_id,
				product_number: row.product_number,
				brand: row.brand,
				name: row.product_name,
				description: row.description,
				price: parseFloat(row.price),
				default_variant_id: row.default_variant_id,
				category: row.category,
				category_id: row.category_id,
				audience: row.audience,
				audience_id: row.audience_id,
				created_at: row.created_at,
				updated_at: row.updated_at,
				variants: [],
			});
		}

		const product = productsMap.get(row.product_id);

		if (row.variant_id) {
			let variant = product.variants.find((v) => v.id === row.variant_id);
			if (!variant) {
				variant = {
					id: row.variant_id,
					color: row.variant_color,
					total_stock: row.variant_stock,
					sizes: [],
					images: [],
				};
				product.variants.push(variant);
			}

			if (row.size_id && !variant.sizes.find((s) => s.size === row.size)) {
				variant.sizes.push({
					size: parseFloat(row.size),
					stock: row.size_stock,
				});
			}

			if (
				row.image_id &&
				!variant.images.find((img) => img.url === row.image_url)
			) {
				variant.images.push({
					url: row.image_url,
					is_main: row.is_main,
				});
			}
		}
	});

	return Array.from(productsMap.values());
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

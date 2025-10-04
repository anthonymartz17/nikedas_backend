const admin = require("../firebase-admin");

async function verifyToken(req, res, next) { 

	const token = req.headers.authorization?.split("Bearer ")[1];


	if (!token) {
		res
			.status(403)
			.json({ error: "Unauthorized request. Token is missing or invalid" });
	}

	try {
		const decodedToken = await admin.auth().verifyIdToken(token);
		req.user = decodedToken;

		next();
	} catch (error) {
		return res
			.status(403)
			.json({ error: "Unauthorized request. Invalid Token." });
	}
	
}

module.exports = { verifyToken };

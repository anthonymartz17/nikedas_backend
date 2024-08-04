
const admin = require("../firebase-admin");

async function verifyToken(req, res, next) {

  const token = req.headers.authorization?.split("Bearer ")[1];
  console.log(token,'llego el token')
	if (!token) {
		res.status(403).json({ error: "Unauthorized request" });
	}
	try {
		const decodedToken = await admin.auth().verifyIdToken(token);
		req.user = decodedToken;

		next();
	} catch (error) {
		return res.status(403).json({ error: "Unauthorized request" });
	}
}

module.exports = { verifyToken };

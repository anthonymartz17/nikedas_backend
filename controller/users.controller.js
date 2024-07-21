// dependencies
const express = require("express");
const users = express.Router();

// queries
const { getAllUsers } = require("../queries/users.queries.js");

// routes
users.get("/", async (req, res) => {
  try {
    const allUsers = await getAllUsers();
    res.status(200).json(allUsers);
  } catch(error) {
      res.status(404).json({error: "Resource not found"});
  }
});

module.exports = users;
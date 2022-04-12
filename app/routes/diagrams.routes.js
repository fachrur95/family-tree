module.exports = (app) => {
  const {
    create,
    findAll,
    findAllPublished,
    findOne,
    update,
    updateParent,
    updateFamily,
    destroy,
    deleteAll,
  } = require("../controllers/diagrams.controller.js");

  var router = require("express").Router();

  // Create a new Tutorial
  router.post("/", create);

  // Retrieve all Tutorials
  router.get("/", findAll);

  // Retrieve all published Tutorials
  router.get("/published", findAllPublished);

  // Retrieve a single Tutorial with id
  router.get("/:id", findOne);

  // Update a Tutorial with id
  router.put("/:id", update);

  router.put("/parent/:id", updateParent);

  router.put("/family/:id", updateFamily);

  // Delete a Tutorial with id
  router.delete("/:id", destroy);

  // Delete all Tutorials
  router.delete("/", deleteAll);

  app.use("/api/diagrams", router);
};

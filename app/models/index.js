const dbConfig = require("../config/db.config.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
  host: dbConfig.HOST,
  dialect: dbConfig.dialect,
  operatorsAliases: false,

  pool: {
    max: dbConfig.pool.max,
    min: dbConfig.pool.min,
    acquire: dbConfig.pool.acquire,
    idle: dbConfig.pool.idle,
  },
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.individuals = require("./individuals.model.js")(sequelize, Sequelize);
db.families = require("./families.model.js")(sequelize, Sequelize);

db.individuals.hasMany(db.families, {
  foreignKey: "husbandId",
  as: "husband",
});
db.families.belongsTo(db.individuals, {
  foreignKey: "husbandId",
  as: "husband",
});

db.individuals.hasMany(db.families, {
  foreignKey: "wifeId",
  as: "wife",
});
db.families.belongsTo(db.individuals, {
  foreignKey: "wifeId",
  as: "wife",
});

module.exports = db;

module.exports = (sequelize, Sequelize) => {
  const Individuals = sequelize.define("individuals", {
    individualId: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    fullName: {
      type: Sequelize.STRING,
    },
    sex: {
      type: Sequelize.ENUM("M", "F", "O"),
      allowNull: false,
    },
    birthDate: {
      type: Sequelize.DATEONLY,
    },
    birthPlace: {
      type: Sequelize.STRING,
    },
    deathDate: {
      type: Sequelize.DATEONLY,
    },
    deathPlace: {
      type: Sequelize.STRING,
    },
  });

  return Individuals;
};

module.exports = (sequelize, Sequelize) => {
  const Families = sequelize.define("families", {
    familyId: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    children: {
      type: Sequelize.JSON,
    },
    marriageDate: {
      type: Sequelize.DATEONLY,
    },
    marriagePlace: {
      type: Sequelize.STRING,
    },
    divorceDate: {
      type: Sequelize.DATEONLY,
    },
    divorcePlace: {
      type: Sequelize.STRING,
    },
  });

  return Families;
};
